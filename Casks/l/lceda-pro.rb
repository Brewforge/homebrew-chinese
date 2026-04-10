cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "3.2.116"
  sha256 "b39b8f0ec3a2b4c7d0993839d211e44ac1ebb887649469f2f177b0945a6e9a53"

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
