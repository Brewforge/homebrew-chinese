cask "noteey" do
  version "1.63.0"
  sha256 "1112f2aae8f98602e62b428fd2101d8c659b41d66b8d1aa3fea37e10860676dd"

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
