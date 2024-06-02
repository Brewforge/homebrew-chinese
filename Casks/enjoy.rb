cask "enjoy" do
  arch arm: "arm64", intel: "x64"

  version "0.2.9"
  sha256 arm:   "51245dcf3050b1b65b025ff510d37d60c7db09a795f0fe50b62f5aa8d16a1d56",
         intel: "4e7ad04fd0f940aff04ee9a6371003f08e883f1ca73e2e5770bf49e0db7792b6"

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
