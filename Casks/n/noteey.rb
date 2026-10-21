cask "noteey" do
  version "1.64.0"
  sha256 "7c8ed0130fc5513d1fa225fc9afb655d54e1b1355a7ca1e082781109f9c76105"

  url "https://github.com/andyyoungm/muenzo/releases/download/v#{version}/Noteey-#{version}.universal.dmg"
  name "Noteey"
  desc "融合卡片和白板的笔记软件"
  homepage "https://noteey.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Noteey.app"

  zap trash: [
    "~/Library/Application Support/Noteey",
    "~/Library/Caches/noteey-updater",
    "~/Library/Logs/Noteey",
    "~/Library/Preferences/com.smartlingo.nottey.mac.plist",
    "~/Library/Saved Application State/com.smartlingo.nottey.mac.savedState",
  ]
end
