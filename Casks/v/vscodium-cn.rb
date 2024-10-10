cask "vscodium-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.94.2.24284"
  sha256 arm:   "9b380fe847ef54c1c4d8f58d10d798c1e5eb3c17572ef0cdfe85fd475f630b3a",
         intel: "d9c8ce3fda404f778fcd42d65bd8dad78d8b2966a88bc3409596077504a8c0b2"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/VSCodium/vscodium/LatestRelease/VSCodium.#{arch}.#{version}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/github-release/"
  name "VSCodium"
  desc "Binary releases of VS Code without MS branding/telemetry/licensing"
  homepage "https://github.com/VSCodium/vscodium"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/github-release/VSCodium/vscodium/LatestRelease"
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
