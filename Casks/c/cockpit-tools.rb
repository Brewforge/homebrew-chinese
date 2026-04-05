cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.20.18"
  sha256 arm:   "6418b4c8df3ad3f8300ff4958f1f55f6f8e9fd5fd20bfc152766e90e26410891",
         intel: "838822e1020f69e18e382e362dafdbdfec943a9b97ed70ffd1d21654a8d2a97a"

  url "https://github.com/jlcodes99/cockpit-tools/releases/download/v#{version}/Cockpit.Tools_#{version}_#{arch}.dmg"
  name "Cockpit Tools"
  desc "通用 AI IDE 账号管理工具"
  homepage "https://github.com/jlcodes99/cockpit-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Cockpit Tools.app"

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
