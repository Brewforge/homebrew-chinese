cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "3.2.174"
  sha256 arm:   "6f81d7a4517626a151b1f42fb94b9e6efb55d12aa7461c7d572006ef88077269",
         intel: "8a0198dd90a29327e0b7f09603baecc8a92c0ac84fd50d452ea88495db644d8a"

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
