cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.9"
  sha256 arm:   "9e8ea1f0731fc00dea3d0f365aa9b83dd5f43fffe0564edbfb8934de8c3312b1",
         intel: "7dc7f1c3856530051104a18ee3d6849aa3ae943015098679ec1a872e20ffa335"

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
