#!/bin/bash
# brewer-inspect.sh — 下载 DMG/ZIP 并提取 App 元信息
# 用法: brewer-inspect.sh <download_url> [arch_label]
# arch_label: arm/intel/universal (默认 universal)
set -euo pipefail

URL="$1"
ARCH="${2:-universal}"
TMPDIR_BASE="/tmp/brewer-inspect"
mkdir -p "$TMPDIR_BASE"

FILE="$TMPDIR_BASE/$(basename "$URL" | sed 's/[?#].*//')"

echo "=== 下载 ==="
if [ -f "$FILE" ]; then
  echo "已存在: $FILE，跳过下载"
else
  curl -fSL --progress-bar -o "$FILE" "$URL"
fi

echo ""
echo "=== SHA256 ($ARCH) ==="
shasum -a 256 "$FILE" | awk '{print $1}'

EXT="${FILE##*.}"
MOUNT_POINT=""

if [ "$EXT" = "dmg" ]; then
  echo ""
  echo "=== 挂载 DMG ==="
  MOUNT_POINT=$(hdiutil attach "$FILE" -nobrowse 2>/dev/null \
    | grep '/Volumes/' | awk -F'\t' '{print $NF}')
  echo "挂载到: $MOUNT_POINT"
elif [ "$EXT" = "zip" ]; then
  echo ""
  echo "=== 解压 ZIP ==="
  MOUNT_POINT="$TMPDIR_BASE/unzipped_$$"
  mkdir -p "$MOUNT_POINT"
  unzip -qo "$FILE" -d "$MOUNT_POINT"
  echo "解压到: $MOUNT_POINT"
fi

if [ -z "$MOUNT_POINT" ]; then
  echo "不支持的格式: $EXT"
  exit 1
fi

echo ""
echo "=== 目录内容 ==="
ls "$MOUNT_POINT"/

# 找到 .app
APP_PATH=$(find "$MOUNT_POINT" -maxdepth 2 -name "*.app" -type d | head -1)
if [ -z "$APP_PATH" ]; then
  echo "未找到 .app"
  exit 1
fi
APP_NAME=$(basename "$APP_PATH")
echo ""
echo "=== App: $APP_NAME ==="

INFO_PLIST="$APP_PATH/Contents/Info"

echo ""
echo "--- Bundle ID ---"
defaults read "$INFO_PLIST" CFBundleIdentifier 2>/dev/null || echo "(未找到)"

echo ""
echo "--- 最低系统版本 ---"
defaults read "$INFO_PLIST" LSMinimumSystemVersion 2>/dev/null || echo "(未找到)"

echo ""
echo "--- 签名状态 ---"
codesign -dv "$APP_PATH" 2>&1 || echo "(未签名)"

echo ""
echo "=== 汇总 ==="
SHA=$(shasum -a 256 "$FILE" | awk '{print $1}')
BUNDLE_ID=$(defaults read "$INFO_PLIST" CFBundleIdentifier 2>/dev/null || echo "")
MIN_OS=$(defaults read "$INFO_PLIST" LSMinimumSystemVersion 2>/dev/null || echo "")
SIGN_INFO=$(codesign -dv "$APP_PATH" 2>&1)
NEEDS_XATTR="false"
if echo "$SIGN_INFO" | grep -qE "adhoc|not signed|code object is not signed"; then
  NEEDS_XATTR="true"
fi

cat <<SUMMARY
app_name=$APP_NAME
bundle_id=$BUNDLE_ID
min_os=$MIN_OS
needs_xattr=$NEEDS_XATTR
sha256=$SHA
arch=$ARCH
mount_point=$MOUNT_POINT
SUMMARY
