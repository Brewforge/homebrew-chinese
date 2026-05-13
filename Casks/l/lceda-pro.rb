cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "3.2.135"
  sha256 arm:   "2ab7822434a5d10e25448f808389ea176b3f4fe1b132b74e3bb16a11fabd5c1a",
         intel: "ff0b23ef80ec32b9715f94b14347b65358f94195f48b05f73381c77447f92965"

  url "https://image.lceda.cn/files/lceda-pro-mac-#{arch}-#{version}.zip"
  name "LCEDA-Pro"
  desc "高效的国产 PCB 设计工具，永久免费"
  homepage "https://lceda.cn/"

  livecheck do
    url "https://lceda.cn/page/download"
    regex(/lceda-pro-mac-#{arch}-(\d+(\.\d+)+)/i)
  end

  auto_updates true
  depends_on :macos

  app "lceda-pro-mac-#{arch}-#{version}/嘉立创EDA(专业版).app"

  zap trash: [
    "~/Library/Application Support/JLCEDA Pro",
    "~/Library/Preferences/cn.lceda.pro.plist",
    "~/Library/Saved Application State/cn.lceda.pro.savedState",
  ]
end
