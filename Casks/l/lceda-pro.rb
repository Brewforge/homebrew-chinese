cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "3.2.175"
  sha256 arm:   "810043e71210486d50cc1cb84b0f80a04c16b1ceec19787ad3f3ed5dfa8507a2",
         intel: "17756c2e6893009ae8e4e8e927956e33cbde635f55d7e136808fdce62086f3cb"

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
