cask "lceda-pro" do
  version "4.1.60"
  sha256 "89a5e0d313d7f6427097c42bbacefe61dcfd8ba234278948831e4e98bc66067b"

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
