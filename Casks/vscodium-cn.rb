cask "vscodium-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.90.1.24165"
  sha256 arm:   "edda34e9947f2a2ce119d52e4b06b5db0913106851b71be6f5e621b7b8e623eb",
         intel: "ea3ea738dc4624d8df0b0e126ed752dcf83647f0fb2026b14dca6ff0d26d36d7"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/VSCodium/vscodium/LatestRelease/VSCodium.#{arch}.#{version}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/"
  name "VSCodium"
  desc "Binary releases of VS Code without MS branding/telemetry/licensing"
  homepage "https://github.com/VSCodium/vscodium"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/github-release/VSCodium/vscodium/LatestRelease"
    regex(/VSCodium\.#{arch}\.(\d+(\.\d+)+)\.dmg/i)
  end

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
