cask "eshelper-cn" do
  version "25.8.0"
  sha256 "57eb78b8d4c9489d64a5aca4463181dafb817f849f6307da5297d451e38fbf23"

  url "https://static.eudic.net/pkg/ehmac.dmg?v=#{version}",
      user_agent: :fake
  name "Eshelper"
  name "西语助手"
  desc "西语学习者必备的工具"
  homepage "https://www.eudic.net/v4/es/app/eshelper"

  livecheck do
    url "https://eudic.yuque.com/org-wiki-eudic-fxu2ea/mfxd3t/tqq00bp7a8p2y1gu"
    regex(/版本号: (\d+(\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

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
