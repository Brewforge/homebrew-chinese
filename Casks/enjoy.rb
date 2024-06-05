cask "enjoy" do
  arch arm: "arm64", intel: "x64"

  version "0.2.10"
  sha256 arm:   "359b955b26ae78ff4565c00633aee9114d9e7fe0b28f178c27f8c6659bd1d036",
         intel: "cc4cabfddfa730cec7f29bd94de05f0b5ecae908e5f3f39a1730970e86bfd173"

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
