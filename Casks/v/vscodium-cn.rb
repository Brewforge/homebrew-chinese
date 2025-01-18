cask "vscodium-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.96.4.25017"
  sha256 arm:   "d4e3152ae1b89e2b46f16d9be71c842ef8709ca36a6851ac0e338fe16d246125",
         intel: "6e52abdf72f0b8c90feaff69a76a450d561cc1f0d1137458fb8cb880be0130d4"

  url "https://mirrors.bfsu.edu.cn/github-release/VSCodium/vscodium/LatestRelease/VSCodium.#{arch}.#{version}.dmg",
      verified: "mirrors.bfsu.edu.cn/github-release/"
  name "VSCodium"
  desc "Binary releases of VS Code without MS branding/telemetry/licensing"
  homepage "https://github.com/VSCodium/vscodium"

  livecheck do
    url "https://mirrors.bfsu.edu.cn/github-release/VSCodium/vscodium/LatestRelease"
    regex(/VScodium\.#{arch}\.v?(\d+(\.\d+)+)\.dmg/i)
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
