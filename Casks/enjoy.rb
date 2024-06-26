cask "enjoy" do
  arch arm: "arm64", intel: "x64"

  version "0.2.13"
  sha256 arm:   "0f81f3266b33ccb84fb5bee2ef01dbc07c95ad7a80a8372bebee8bd845f6e6ab",
         intel: "d43045e9fdc7381eaa39290b5c2668bdfdfb3cc2377e2409f52d9dbd8a2456a1"

  url "https://github.com/xiaolai/everyone-can-use-english/releases/download/v#{version}/Enjoy-#{version}-#{arch}.dmg",
      verified: "github.com/xiaolai/everyone-can-use-english/"
  name "Enjoy"
  desc "AI 最好的助教"
  homepage "https://1000h.org/enjoy-app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Enjoy.app"

  zap trash: [
    "~/Library/Application Support/Enjoy/",
    "~/Library/Caches/com.electron.enjoy",
    "~/Library/Caches/com.electron.enjoy.ShipIt",
    "~/Library/HTTPStorages/com.electron.enjoy",
    "~/Library/Preferences/com.electron.enjoy.plist",
    "~/Library/Saved Application State/com.electron.enjoy.savedState",
  ]
end
