cask "vscodium-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.97.0.25037"
  sha256 arm:   "6985346327bd7f8b41dc7ebc87e923d17d7b3b4e5148285eef2e4c92c80a54de",
         intel: "52e8431e1be1d0bb831a320dafbb986dafaea667f89f4fe9e46c930e13e117d8"

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
