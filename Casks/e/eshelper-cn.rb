cask "eshelper-cn" do
  version "26.11.3"
  sha256 "262fc8340e2810dad54332e6859d773273ef92bb501e7825bacd4c28c3675454"

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

  depends_on macos: :ventura

  app "Eudic_es.app"

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/Eudic_es.app"]
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
