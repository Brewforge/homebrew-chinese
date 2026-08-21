cask "easyspider" do
  version "0.6.3"
  sha256 "9ea5e464d03e3e43b4dc74509ad94d9946f370b1533fdf1a8a8cfdae9cbbd812"

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
    "~/Library/Application Support/CrashReporter/Google Chrome_1ACF1E2B-4D5C-504D-B6FE-65DDCCEC136A",
    "~/Library/Application Support/EasySpider",
    "~/Library/Preferences/com.electron.easyspider.plist",
    "~/Library/Saved Application State/com.electron.easyspider.savedState",
    "~/Library/Saved Application State/com.google.Chrome.app.ahiigpfcghkbjfcibpojancebdfjmoop.savedState",
    "~/Library/Saved Application State/com.google.Chrome.app.nlalbmkafgmoifbeooblidblkmlhhpnc.savedState",
  ]
end
