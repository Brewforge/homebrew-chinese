cask "noteey" do
  version "1.15.0"
  sha256 "819c267499c867b0d0653c7a5edf3626959a6d301316ca72988c2118bae8816c"

  url "https://github.com/andyyoungm/muenzo/releases/download/v#{version}/Noteey-#{version}.universal.dmg",
      verified: "github.com/andyyoungm/muenzo/"
  name "Noteey"
  desc "融合卡片和白板的笔记软件"
  homepage "https://www.noteey.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Noteey.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.smartlingo.nottey.mac",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.smartlingo.nottey.mac.helper.GPU",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.smartlingo.nottey.mac.b5V2KE",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.com.smartlingo.nottey.mac.PDzXg5",
    "~/Library/Application Support/Noteey",
    "~/Library/Caches/noteey-updater",
    "~/Library/Logs/Noteey",
    "~/Library/Preferences/com.smartlingo.nottey.mac.plist",
    "~/Library/Saved Application State/com.smartlingo.nottey.mac.savedState",
  ]
end
