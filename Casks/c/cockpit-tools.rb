cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.8"
  sha256 arm:   "7543dadc5026ad72d0622849360f2f02c11474e21970a73f8d61bd5985d33bb4",
         intel: "f27fc4374f523b4e98da74762ed7da953a6a2249235cf32b707f7d6a726f0480"

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
