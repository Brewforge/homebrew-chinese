cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "3.2.166"
  sha256 arm:   "6a61ab76e9df28cf210145405c8c516e36f07ac357fc9eaec5cb51d3315c8acd",
         intel: "a0c1d4a12f75ca6ccdbc2f9439600f926b76045faf4a05f699209c21614c9974"

  url "https://image.lceda.cn/files/lceda-pro-mac-#{arch}-#{version}.zip"
  name "LCEDA-Pro"
  desc "高效的国产 PCB 设计工具，永久免费"
  homepage "https://lceda.cn/"

  livecheck do
    url "https://lceda.cn/page/download"
    regex(/lceda-pro-mac-#{arch}-(\d+(\.\d+)+)/i)
  end

  depends_on :macos
  container nested: "嘉立创EDA(专业版).dmg"

  app "嘉立创EDA(专业版).app"

  zap trash: [
    "~/Library/Application Support/JLCEDA Pro",
    "~/Library/Preferences/cn.lceda.pro.plist",
    "~/Library/Saved Application State/cn.lceda.pro.savedState",
  ]
end
