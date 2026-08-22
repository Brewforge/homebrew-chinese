cask "easyspider" do
  version "0.6.5"
  sha256 "40f40ad9040792867613ac2809052b9410048cd5a598b09d5bae08de9ed04d25"

  url "https://github.com/NaiboWang/EasySpider/releases/download/v#{version}/EasySpider_#{version}_MacOS_Apple_Arm_Chip.7z",
      verified: "github.com/NaiboWang/EasySpider/"
  name "EasySpider"
  desc "Visual No-Code/Code-Free Web Crawler/Spider"
  homepage "https://easyspider.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "EasySpider_MacOS/EasySpider.app"

  zap trash: [
    "~/Library/Application Support/EasySpider",
    "~/Library/Preferences/com.electron.easyspider.plist",
    "~/Library/Saved Application State/com.electron.easyspider.savedState",
    "~/Library/Saved Application State/com.google.Chrome.app.ahiigpfcghkbjfcibpojancebdfjmoop.savedState",
    "~/Library/Saved Application State/com.google.Chrome.app.nlalbmkafgmoifbeooblidblkmlhhpnc.savedState",
  ]
end
