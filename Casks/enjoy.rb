cask "enjoy" do
  arch arm: "arm64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "c3f229ae1a5ae459035f6f9759f085dd31184b3d8e6415190a2bf715421aa423",
         intel: "6010df1646176b964c2ad8fba32f189aff9c0d04018161d330971fa33fe06615"

  url "https://github.com/xiaolai/everyone-can-use-english/releases/download/v#{version}/Enjoy-#{version}-#{arch}.dmg",
      user_agent: :fake
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
