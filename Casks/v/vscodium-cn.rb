cask "vscodium-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.97.2.25045"
  sha256 arm:   "48d01a0663b7a6396f41ddc11296eb812d58e9fe3b671b9d33e6b21621e40f21",
         intel: "af8fe5721ef431ab59fe05a06a3a462c40884229f61cc2962ea01d3e66997243"

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
