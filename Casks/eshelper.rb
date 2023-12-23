cask "eshelper" do
  version "4.5.8,1140"
  sha256 "572e610ec4e16bddcb7fc9d8d04fb735e643db9b7814321b4cac547113a39bf2"

  url "https://static.frdic.com/pkg/ehmac.dmg??v=#{version.csv.second}",
      verified:   "static.frdic.com/",
      user_agent: :fake
  name "Eshelper"
  name "西语助手"
  desc "Spanish Chinese dictionary and learning tool"
  homepage "https://www.eudic.net/v4/es/app/eshelper"

  livecheck do
    url "https://www.eudic.net/update/eshelper_mac.xml"
    strategy :sparkle
  end

  auto_updates true

  app "Eudic_es.app"

  uninstall quit: [
    "com.eusoft.eshelper",
    "com.eusoft.eshelper.LightPeek",
    "com.eusoft.eshelper.QuickLook",
  ]

  zap trash: [
    "~/Library/Application Support/com.eusoft.eshelper",
    "~/Library/Caches/com.eusoft.eshelper.LightPeek",
    "~/Library/Caches/com.eusoft.eshelper",
    "~/Library/Containers/com.eusoft.eshelper.QuickLook",
    "~/Library/Eudb_es",
    "~/Library/Preferences/com.eusoft.eshelper.LightPeek.plist",
    "~/Library/Preferences/com.eusoft.eshelper.plist",
    "~/Library/Preferences/group.com.eusoft.eshelper.plist",
  ]
end
