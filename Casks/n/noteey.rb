cask "noteey" do
  version "1.11.1"
  sha256 "60d14072182eaa56930c1c524f806d575b85447a24b122e7a408c21e2179d5e1"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/andyyoungm/muenzo/releases/download/v#{version}/Noteey-#{version}.universal.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "Noteey"
  desc "融合卡片和白板的笔记软件"
  homepage "https://www.noteey.com/"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

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
