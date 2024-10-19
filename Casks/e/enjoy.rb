cask "enjoy" do
  arch arm: "arm64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "e7102954020acce637f7651d91ced1d64a162b64c123f3865ddaa50937e94ec0",
         intel: "00657b4579d128cac5d6bf7785c6d14532494407a75de6ca13bdc5866014ff1e"

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
