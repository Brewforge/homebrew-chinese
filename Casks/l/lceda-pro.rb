cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "3.2.149"
  sha256 arm:   "817be3db3a93f7c419f4a03a4d59127c99c6579dca28f9341168e07d48e41e18",
         intel: "8a9910eccbaa42514e38b4ae47e9af5176e03459723de3585ae4498619a06570"

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
