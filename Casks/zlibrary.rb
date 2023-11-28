cask "zlibrary" do
  version "latest"
  sha256 :no_check

  url "https://zlibrary-asia.se/soft/zlibrary-setup-latest.dmg"
  name "Z-Library"
  desc "Your gateway to knowledge and culture"
  homepage "https://zlibrary-asia.se/"

  auto_updates true

  app "Z-Library.app"

  zap trash: [
    "~/Library/Application Support/Z-Library",
    "~/Library/Preferences/z-lib.plist",
    "~/Library/Saved Application State/z-lib.savedState",
  ]
end
