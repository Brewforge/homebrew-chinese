cask "easyspider" do
  arch arm: "Apple_Arm", intel: "Intel"

  version "0.6.3"
  sha256 arm:   "9ea5e464d03e3e43b4dc74509ad94d9946f370b1533fdf1a8a8cfdae9cbbd812",
         intel: "1e5b3d1fa0fccce8c1a137927101d2ace027dfaf1cfad886f7d75309cedf9a29"

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
