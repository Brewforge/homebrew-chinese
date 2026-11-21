cask "lceda-pro" do
  version "4.1.105"
  sha256 "035b38df05d4c50b69f5a2e3d55ef951cefac1b397df50936198b879b4252a7e"

  url "https://image.lceda.cn/files/lceda-pro-mac-arm64-#{version}.zip"
  name "LCEDA-Pro"
  desc "高效的国产 PCB 设计工具，永久免费"
  homepage "https://lceda.cn/"

  livecheck do
    url "https://lceda.cn/page/download"
    regex(/lceda-pro-mac-arm64-(\d+(\.\d+)+)/i)
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
