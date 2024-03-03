cask "eshelper" do
  version "4.6.2"
  sha256 "066321af699e384d2be5a34a925dc5723ab94592d9ab535312eb51f60d70549c"

  url "https://static.eudic.net/pkg/ehmac.dmg?v=#{version}",
      verified:   "static.frdic.com/",
      user_agent: :fake
  name "Eshelper"
  name "西语助手"
  desc "Spanish Chinese dictionary and learning tool"
  homepage "https://www.eudic.net/v4/es/app/eshelper"

  livecheck do
    url "https://static.eudic.net/pkg/eshelper_mac.xml?noCache=1"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Eudic_es.app"

  uninstall quit: [
    "com.eusoft.eshelper",
    "com.eusoft.eshelper.LightPeek",
    "com.eusoft.eshelper.QuickLook",
  ]

  zap trash: [
    "~/Library/Application Support/com.eusoft.eshelper",
    "~/Library/Caches/com.eusoft.eshelper",
    "~/Library/Caches/com.eusoft.eshelper.LightPeek",
    "~/Library/Containers/com.eusoft.eshelper.QuickLook",
    "~/Library/Eudb_es",
    "~/Library/Preferences/com.eusoft.eshelper.LightPeek.plist",
    "~/Library/Preferences/com.eusoft.eshelper.plist",
    "~/Library/Preferences/group.com.eusoft.eshelper.plist",
  ]
end
