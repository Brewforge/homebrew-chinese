cask "frhelper-cn" do
  version "26.9.0"
  sha256 "daf90bace82d25114c564ed5ac9224bf1627729b5297fe7a6720c79f05d7b543"

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

  depends_on macos: :ventura

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
