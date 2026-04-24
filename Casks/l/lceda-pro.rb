cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "3.2.116"
  sha256 arm:   "f8033206742db927593d8d52fd289cbbcf3770f8eea66df047de40dadc836cd9",
         intel: "786d9c10157a3300c80297011cc52e989edcb053a78fb213e3369e5afd8a063a"

  url "https://image.lceda.cn/files/lceda-pro-mac-#{arch}-#{version}.zip"
  name "LCEDA-Pro"
  desc "高效的国产 PCB 设计工具，永久免费"
  homepage "https://lceda.cn/"

  livecheck do
    url "https://lceda.cn/page/download"
    regex(/lceda-pro-mac-#{arch}-(\d+(\.\d+)+)/i)
  end

  auto_updates true

  app "lceda-pro-mac-#{arch}-#{version}/嘉立创EDA(专业版).app"

  zap trash: [
    "~/Library/Application Support/JLCEDA Pro",
    "~/Library/Preferences/cn.lceda.pro.plist",
    "~/Library/Saved Application State/cn.lceda.pro.savedState",
  ]
end
