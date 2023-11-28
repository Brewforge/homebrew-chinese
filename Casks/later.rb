cask "later" do
  version "1.91"
  sha256 :no_check

  url "https://github.com/alyssaxuu/later/raw/master/Later.dmg",
      verified: "github.com/alyssaxuu/later/"
  name "Later"
  desc "Clear and restore your workspace with ease"
  homepage "https://getlater.app/"

  app "Later.app"

  zap trash: [
    "~/Library/Preferences/alyssaxuu.Later.plist",
    "~/Library/Saved Application State/alyssaxuu.Later.savedState",
  ]
end
