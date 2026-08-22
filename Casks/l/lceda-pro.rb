cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "3.2.186"
  sha256 arm:   "23197786d12eaaea990171aa4967fb4851de546db46c3b43bb6e88baacf6afea",
         intel: "2d5a6b46bab2773fbc29b00779b92d76e8479077e7c1f5b3f5bc6abbd2e206ad"

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
