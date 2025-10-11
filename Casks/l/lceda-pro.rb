cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "2.2.43.1"
  sha256 :no_check

  url "https://image.lceda.cn/files/lceda-pro-mac-#{arch}-#{version}.zip"
  name "LCEDA-Pro"
  desc "高效的国产 PCB 设计工具，永久免费"
  homepage "https://lceda.cn/"

  livecheck do
    url "https://lceda.cn/page/download"
    regex(/lceda-pro-mac-#{arch}-(\d+(\.\d+)+)/i)
  end

  auto_updates true

  app "lceda-pro-mac-#{arch}-#{version}/LCEDA-Pro.app"

  uninstall delete: caskroom_path.to_s

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/cn.lceda.pro",
    "~/Library/Application Support/JLCEDA Pro",
    "~/Library/Preferences/cn.lceda.pro.plist",
    "~/Library/Saved Application State/cn.lceda.pro.savedState",
  ]
end
