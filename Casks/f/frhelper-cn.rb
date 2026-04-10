cask "frhelper-cn" do
  version "11.6.0"
  sha256 "71d45bc1db561ec6702618dbf9903a463a590da42e60088cd565536ca3101a38"

  url "https://static.eudic.net/pkg/fhmac.dmg?v=#{version}",
      user_agent: :fake
  name "Frhelper"
  name "法语助手"
  desc "法语学习者必备的工具"
  homepage "https://www.eudic.net/v4/fr/app/frhelper"

  livecheck do
    url :homepage
    regex(/应用版本：(\d+(\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

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
