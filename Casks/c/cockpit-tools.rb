cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.17"
  sha256 arm:   "e1e6eeb3d743f00f1853da8f28b992ae51d29ee473cb3b7e791e37c8e68d63bc",
         intel: "ed95f547f3fb75c47f82eac0cfeec4a84415067b7e29b3fb853e0ef15fd9b8e5"

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

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Cockpit Tools.app"]
  end

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
