cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "3.2.184"
  sha256 arm:   "f51dbd54b3f6d879588b41b7cb18cf792a8f45e480fdf6fbbe8ea62e36e3fac0",
         intel: "9dff6ca7363cb55924f42118f18e3625ae5530b231ba91ab9a59336fd0332e3b"

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
