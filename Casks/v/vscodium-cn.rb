cask "vscodium-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.98.2.25078"
  sha256 arm:   "726e2ea08022609ef6d7a797c0d5fe90547ab3bfad1f3eedf343798ebd80c5dd",
         intel: "9bb00d89dae4a7caec0d73e0f1b8f905086a1cfcb60f9c37467d7628ac7c9cd7"

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
