cask "enjoy" do
  arch arm: "arm64", intel: "x64"

  version "0.2.6"
  sha256 arm:   "f2db919227e6e14ac341fdae5bb6bc88254163a8f1cf607dcabfe80aa69e56da",
         intel: "d6aaee8294235c5ac9d6e7908c6c6e78d2e262f044629cfbcdf1dbf35b7380ca"

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
