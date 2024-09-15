cask "enjoy" do
  arch arm: "arm64", intel: "x64"

  version "0.5.1"
  sha256 arm:   "e43b45a2d2ce22235a144697020886be9ebd4d7ff935cdee0c436d01bc6c731f",
         intel: "eafe7767806540ae172802a2aa2004424ad298ca867976e2e275c15bcb66e8c4"

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
