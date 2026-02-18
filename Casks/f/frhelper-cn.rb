cask "frhelper-cn" do
  version "11.6.0"
  sha256 "2af5b8bcb7d1c1917d8dcb69af5e6760915b4557fbd91783317afbec9403d164"

  url "https://static.eudic.net/pkg/fhmac.dmg?v=#{version}",
      user_agent: :fake
  name "Frhelper"
  name "法语助手"
  desc "法语学习者必备的工具"
  homepage "https://www.eudic.net/v4/fr/app/frhelper"

  livecheck do
    url "https://eudic.yuque.com/org-wiki-eudic-fxu2ea/mfxd3t/tqq00bp7a8p2y1gu"
    regex(/版本号: (\d+(\.\d+)+)/i)
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
