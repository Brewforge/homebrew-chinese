cask "noteey" do
  version "1.25.0"
  sha256 "d4e5a5561f374c330ad16b1f02de5d013ed2d58d6e736e356fa47bb3b56497de"

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
