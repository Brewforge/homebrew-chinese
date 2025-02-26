cask "enjoy" do
  arch arm: "arm64", intel: "x64"

  version "0.7.8"
  sha256 arm:   "2ea2438ffd2377f105fd9fb9ee17766cc48a74d5acb31269964726ecc05b2a3b",
         intel: "5f17131d2501b75930a7d5d7e0f62eb403ceccdd4e006a29b6207a396b3047e4"

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
