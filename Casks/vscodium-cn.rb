cask "vscodium-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.85.2.24019"
  sha256 arm:   "21b4916865c70e77ca8ba220ef8d2bb7c98f4d7683ed3c6a33cdaa36aa754a95",
         intel: "bfc6b551c9cba15ace843995dd9822c7c93108330fcbfcb331a654189a9542eb"

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
