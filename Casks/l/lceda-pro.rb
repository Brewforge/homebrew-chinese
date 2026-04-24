cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "3.2.127"
  sha256 arm:   "e7199c10eb2f58ea1b3ea212f05562c79633804aaafbdb6379844159cbf2cf87",
         intel: "528e8a4711005463e2c9836c7cf9c65b647d88bdcee91ff8f2619c350f894b7b"

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
