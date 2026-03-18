cask "noteey" do
  version "1.50.0"
  sha256 "f2396b20b82968b37feba79daf4889c27aa15f195ae18ee0ecc73c961d1aee69"

  url "https://github.com/andyyoungm/muenzo/releases/download/v#{version}/Noteey-#{version}.universal.dmg",
      verified: "github.com/andyyoungm/muenzo/"
  name "Noteey"
  desc "融合卡片和白板的笔记软件"
  homepage "https://noteey.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Noteey.app"

  zap trash: [
    "~/Library/Application Support/Noteey",
    "~/Library/Caches/noteey-updater",
    "~/Library/Logs/Noteey",
    "~/Library/Preferences/com.smartlingo.nottey.mac.plist",
    "~/Library/Saved Application State/com.smartlingo.nottey.mac.savedState",
  ]
end
