cask "frhelper" do
  version "4.6.8"
  sha256 "2b82b48b64c5d48410a950148b1ad4dbf6f098f2c2e1e1185750e994cdf77143"

  url "https://static.eudic.net/pkg/fhmac.dmg?#{version}",
      user_agent: :fake
  name "Frhelper"
  name "法语助手"
  desc "French-Chinese dictionary and learning tool"
  homepage "https://www.eudic.net/v4/fr/app/frhelper"

  livecheck do
    url "https://static.eudic.net/pkg/frhelper_mac.xml?noCache=1"
    strategy :sparkle, &:short_version
  end

  depends_on macos: ">= :high_sierra"

  app "Frhelper.app"

  uninstall quit: [
    "com.eusoft.frhelper",
    "com.eusoft.frhelper.LightPeek",
    "com.eusoft.frhelper.QuickLook",
  ]

  zap trash: [
    "~/Library/Application Support/com.eusoft.frhelper",
    "~/Library/Caches/com.eusoft.frhelper",
    "~/Library/Caches/com.eusoft.frhelper.LightPeek",
    "~/Library/Containers/com.eusoft.frhelper.QuickLook",
    "~/Library/Eudb_fr",
    "~/Library/Preferences/com.eusoft.frhelper.LightPeek.plist",
    "~/Library/Preferences/com.eusoft.frhelper.plist",
    "~/Library/Preferences/group.com.eusoft.frhelper.plist",
  ]
end
