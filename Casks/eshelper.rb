cask "eshelper" do
  version "2024-07-26"
  sha256 "926b892365d77658d6b0270f5697f58063c92d0a8d39e834c2206347cd61bee8"

  url "https://static.eudic.net/pkg/ehmac.dmg?#{version}",
      user_agent: :fake
  name "Eshelper"
  name "西语助手"
  desc "Spanish Chinese dictionary and learning tool"
  homepage "https://www.eudic.net/v4/es/app/eshelper"

  livecheck do
    url "https://www.eudic.net/v4/es/app/download"
    regex(/href=.*?\.dmg\?v=(\d{4}-\d{2}-\d{2})/i)
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
