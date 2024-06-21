cask "enjoy" do
  arch arm: "arm64", intel: "x64"

  version "0.2.12"
  sha256 arm:   "3ceb5397fe869cec3e40c8cf80f1eae5d9d8f1e7d7a53f563cfa2bbf8d9849ce",
         intel: "a4120e76de0882ff7d4290d3e2c7fa976a01da911678e141ac69893e5d545a77"

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
