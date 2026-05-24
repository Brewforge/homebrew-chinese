cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.24.7"
  sha256 arm:   "1fef5bfb99fe215031209a3e249ce0a180a8711fe7b2f2a8b625f3f08fab9785",
         intel: "71d25f27387f0de46d219294afe99c6efcc3d5c9ae6eb1dd531e7cd77055ab77"

  url "https://github.com/jlcodes99/cockpit-tools/releases/download/v#{version}/Cockpit.Tools_#{version}_#{arch}.dmg"
  name "Cockpit Tools"
  desc "通用 AI IDE 账号管理工具"
  homepage "https://github.com/jlcodes99/cockpit-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Cockpit Tools.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Cockpit Tools.app"]
  end

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
