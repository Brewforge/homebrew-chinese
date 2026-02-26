#!/bin/bash
# brewer-check.sh — 对 cask 执行 style/audit/livecheck 三连检查
# 用法: brewer-check.sh <cask-name>
set -euo pipefail

CASK="$1"
FAIL=0

echo "=== brew style --fix $CASK ==="
if brew style --fix "$CASK" 2>&1; then
  echo "PASS"
else
  echo "FAIL"
  FAIL=1
fi

echo ""
echo "=== brew audit --strict $CASK ==="
if brew audit --strict "$CASK" 2>&1; then
  echo "PASS"
else
  echo "FAIL"
  FAIL=1
fi

echo ""
echo "=== brew lc --cask $CASK ==="
if brew lc --cask "$CASK" 2>&1; then
  echo "PASS"
else
  echo "FAIL"
  FAIL=1
fi

echo ""
if [ $FAIL -eq 0 ]; then
  echo "全部通过"
else
  echo "有检查未通过，请查看上方输出"
  exit 1
fi
