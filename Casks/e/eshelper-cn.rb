cask "eshelper-cn" do
  version "11.6.0"
  sha256 "023d51c23442ec770cfcd94cb8ab5a6bc725d07422f733062815d85a2602eab3"

  url "https://static.eudic.net/pkg/ehmac.dmg?v=#{version}",
      user_agent: :fake
  name "Eshelper"
  name "西语助手"
  desc "西语学习者必备的工具"
  homepage "https://www.eudic.net/v4/es/app/eshelper"

  livecheck do
    url :homepage
    regex(/应用版本：(\d+(\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Eudic_es.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Eudic_es.app"]
  end

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
