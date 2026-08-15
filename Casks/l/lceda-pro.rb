cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "3.2.181"
  sha256 arm:   "92944d4a0b420b29a5fe54ea6667d30eb06a3c59fbf4eb62b9f3732250317e1e",
         intel: "e3d521a83a5b4911816686622cf8cd6040ad6955cd31ee7d46b7e24f633f10c4"

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
