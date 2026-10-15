cask "noteey" do
  version "1.63.1"
  sha256 "0ca4fe1f05b9aa1421b35a4ae7c42d16624bf040e2a1023f94370b4ec1e7eced"

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
