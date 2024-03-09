cask "vscodium-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.87.1.24068"
  sha256 arm:   "38372ecd1b0d8c0a008ce9701d8168a8748cd021ed664130474bdac5c62dfbc4",
         intel: "203f7b166965da00a2c002769741315a6da37da2556a5f7aad258db41d16340d"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/VSCodium/vscodium/LatestRelease/VSCodium.#{arch}.#{version}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/"
  name "VSCodium"
  desc "Binary releases of VS Code without MS branding/telemetry/licensing"
  homepage "https://github.com/VSCodium/vscodium"

  auto_updates true
  conflicts_with cask: "vscodium"

  app "VSCodium.app"
  binary "#{appdir}/VSCodium.app/Contents/Resources/app/bin/codium"

  zap trash: [
    "~/.vscode-oss",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.visualstudio.code.oss.sfl*",
    "~/Library/Application Support/VSCodium",
    "~/Library/Logs/VSCodium",
    "~/Library/Preferences/com.visualstudio.code.oss.helper.plist",
    "~/Library/Preferences/com.visualstudio.code.oss.plist",
    "~/Library/Saved Application State/com.visualstudio.code.oss.savedState",
  ]
end
