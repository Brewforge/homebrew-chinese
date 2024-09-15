cask "easyspider" do
  arch arm: "Apple_Arm", intel: "Intel"

  version "0.6.2"
  sha256 arm:   "54b6a96de81e8b1456807dc9773973411fdc61653b874cc75c93a91621a759bd",
         intel: "5633656e9e78fe5590563ce59132320ef228708843f7ac368dd470f535acb8fb"

  url "https://github.com/NaiboWang/EasySpider/releases/download/v#{version}/EasySpider_#{version}_MacOS_#{arch}_Chip.7z",
      verified: "github.com/NaiboWang/EasySpider/"
  name "EasySpider"
  desc "Visual No-Code/Code-Free Web Crawler/Spider"
  homepage "https://easyspider.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

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
