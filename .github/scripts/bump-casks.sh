#!/bin/bash

set -euo pipefail

repo="${GITHUB_REPOSITORY:-Brewforge/homebrew-chinese}"
run_url="${GITHUB_SERVER_URL:-https://github.com}/$repo/actions/runs/${GITHUB_RUN_ID:-0}"
summary="${GITHUB_STEP_SUMMARY:-/dev/null}"
label="bump失败"
label_color="FBCA04"
bump_options=(--verbose)

echo "> Running brew livecheck..."

items=$(brew livecheck --tap brewforge/chinese --extract-plist --full-name --json || echo "[]")

# Tracking issues are the memory of this script: one open issue per cask that
# cannot be bumped, closed automatically once a bump goes through again.
issue_for() {
  local cask="${1##*/}"
  gh issue list --repo "$repo" --state open --label "$label" --search "$cask in:title" \
    --json number --jq '.[0].number // empty' 2>/dev/null || true
}

report_failure() {
  local item="$1" reason="$2" number
  number=$(issue_for "$item")
  if [ -n "$number" ]; then
    gh issue comment "$number" --repo "$repo" \
      --body "仍在失败（[运行日志]($run_url)）：\`\`\`
$reason
\`\`\`" >/dev/null || true
    echo "> Commented on issue #$number"
  else
    gh issue create --repo "$repo" --label "$label" \
      --title "bump 失败：${item##*/}" \
      --body "自动创建：[运行日志]($run_url)
自动关闭条件：该 cask 能被 \`brew bump-cask-pr\` 正常升版。

\`\`\`
$reason
\`\`\`" >/dev/null || echo "::warning::could not open issue for $item"
  fi
}

report_success() {
  local item="$1" number
  number=$(issue_for "$item")
  [ -n "$number" ] || return 0
  gh issue close "$number" --repo "$repo" --reason completed \
    --comment "已能正常 bump（[运行日志]($run_url)），自动关闭。" >/dev/null || true
  echo "> Closed issue #$number"
}

gh label create "$label" --repo "$repo" --color "$label_color" \
  --description "brew bump-cask-pr 失败，需人工处理" --force >/dev/null 2>&1 || true

bumped=()
failed=()
failed_versions=()
failed_reasons=()
skipped=0

while IFS= read -r item_obj; do
  item=$(jq -r '.cask' <<<"$item_obj")
  status=$(jq -r '.status' <<<"$item_obj")
  current=$(jq -r '.version.current' <<<"$item_obj")
  latest=$(jq -r '.version.latest' <<<"$item_obj")
  outdated=$(jq -r '.version.outdated' <<<"$item_obj")
  newer=$(jq -r '.version.newer_than_upstream' <<<"$item_obj")

  echo "---"

  if [ "$status" = "skipped" ]; then
    message=$(jq -r '.messages[0]' <<<"$item_obj")
    echo -e "$item: \033[0;31m$message\033[0m"
    skipped=$((skipped + 1))
    continue
  fi

  if [ "$outdated" = "false" ]; then
    echo -e "$item: \033[0;32mUp-to-date\033[0m"
    continue
  fi

  if [ "$newer" = "true" ]; then
    echo -e "$item: \033[0;33mNewer than upstream\033[0m"
    continue
  fi

  echo "> Bumping $item from $current to $latest..."

  if [ "$latest" = "null" ]; then
    echo "$item_obj"
    cat "$(brew edit --cask "$item" --print-path)"
    echo -e "\033[0;31m> Error: version.latest is null\033[0m"
    failed+=("$item")
    failed_versions+=("unknown")
    failed_reasons+=("version.latest is null (livecheck returned nothing)")
    report_failure "$item" "version.latest is null (livecheck returned nothing)"
    continue
  fi

  echo "* Running brew bump-cask-pr $item --version=$latest ${bump_options[*]}..."

  # Upstream flakiness (mirror 404, reset CDN connection, republished artifact)
  # must not abort the whole run: record it, keep bumping the rest, fail at the
  # end so the run stays visible.
  if output=$(brew bump-cask-pr "$item" --version="$latest" "${bump_options[@]}" 2>&1); then
    printf '%s\n' "$output"
    echo "> Done for $item"
    bumped+=("$item")
    report_success "$item"
  else
    printf '%s\n' "$output"
    reason=$(printf '%s\n' "$output" | grep -E 'Download failed|curl: \(|SHA-256 mismatch|is not reachable|differs from|exception while auditing|##\[error\]' \
      | tail -1 | cut -c1-200)
    reason=${reason:-unknown error}
    echo "::warning::bump failed for $item: $reason"
    failed+=("$item")
    failed_versions+=("$latest")
    failed_reasons+=("${reason//|/\\|}")
    report_failure "$item" "$reason"
  fi
done < <(jq -c '.[] | select(.cask != null)' <<<"$items")

echo "---"
echo "bumped ${#bumped[@]}, failed ${#failed[@]}, skipped $skipped"

{
  echo "## bump 结果"
  echo
  echo "- 已 bump：${#bumped[@]}"
  echo "- 失败：${#failed[@]}"
  echo "- livecheck skipped：$skipped"
  echo
  if [ "${#failed[@]}" -gt 0 ]; then
    echo "| cask | 目标版本 | 错误 |"
    echo "| --- | --- | --- |"
    for i in "${!failed[@]}"; do
      echo "| \`${failed[$i]##*/}\` | ${failed_versions[$i]} | ${failed_reasons[$i]} |"
    done
    echo
    echo "失败项均已登记到 [\`$label\`](https://github.com/$repo/labels/$(printf '%s' "$label" | jq -sRr @uri)) 标签的 issue；恢复后自动关闭。"
  else
    echo "本轮无失败。"
  fi
} >>"$summary"

if [ "${#failed[@]}" -gt 0 ]; then
  exit 1
fi