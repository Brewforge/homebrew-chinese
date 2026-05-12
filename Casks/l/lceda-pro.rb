cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "3.2.131"
  sha256 arm:   "7cc13a1dd81bf3d828a306eb5e18bba3abb855ffbfae0797a1d412ca91fd5662",
         intel: "7112a60bad79dea6226021936f0be7305b2340acea9226a3738510052832a318"

  url "https://image.lceda.cn/files/lceda-pro-mac-#{arch}-#{version}.zip"
  name "LCEDA-Pro"
  desc "高效的国产 PCB 设计工具，永久免费"
  homepage "https://lceda.cn/"

  livecheck do
    url "https://lceda.cn/page/download"
    regex(/lceda-pro-mac-#{arch}-(\d+(\.\d+)+)/i)
  end

  auto_updates true
  depends_on :macos

  app "lceda-pro-mac-#{arch}-#{version}/嘉立创EDA(专业版).app"

  zap trash: [
    "~/Library/Application Support/JLCEDA Pro",
    "~/Library/Preferences/cn.lceda.pro.plist",
    "~/Library/Saved Application State/cn.lceda.pro.savedState",
  ]
end
