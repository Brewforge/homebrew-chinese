cask "xnapper" do
  version "1.17.1"
  sha256 :no_check

  url "https://xnapper.com/dmg/Xnapper-#{version}.dmg"
  name "xnapper"
  desc "生成美观的截图"
  homepage "https://xnapper.com/"

  livecheck do
    url :homepage
    regex(/(\d+(\.\d+)+).+macos/i)
  end

  auto_updates true

  app "Xnapper.app"

  zap trash: [
    "~/Library/Application Scripts/com.devuap.beautyshotapp-LaunchAtLoginHelper",
    "~/Library/Application Scripts/com.devuap.beautyshotapp.Xnapper-Mac-Share-Extension",
    "~/Library/Application Support/Xnapper",
    "~/Library/Containers/com.devuap.beautyshotapp-LaunchAtLoginHelper",
    "~/Library/Containers/com.devuap.beautyshotapp.Xnapper-Mac-Share-Extension",
    "~/Library/HTTPStorages/com.devuap.beautyshotapp",
    "~/Library/Preferences/com.devuap.beautyshotapp.plist",
    "~/Library/Saved Application State/com.devuap.beautyshotapp.savedState",
  ]
end
