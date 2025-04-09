cask "dehelper-cn" do
  version "11.6.0"
  sha256 "727d874fdb76b8e0f20054dd553e0b9700ccd93c037a74e9eb88aedc0174ab9d"

  url "https://static.eudic.net/pkg/dhmac.dmg?v=#{version}",
      user_agent: :fake
  name "dehelper"
  name "德语助手"
  desc "德语学习者必备的工具"
  homepage "https://www.eudic.net/v4/de/app/dehelper"

  livecheck do
    url :homepage
    regex(/应用版本：(\d+(\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Eudic_de.app"

  uninstall quit: [
    "com.eusoft.dehelper",
    "com.eusoft.dehelper.LightPeek",
    "com.eusoft.dehelper.QuickLook",
  ]

  zap trash: [
    "~/Library/Application Support/com.eusoft.dehelper",
    "~/Library/Cachde/com.eusoft.dehelper",
    "~/Library/Cachde/com.eusoft.dehelper.LightPeek",
    "~/Library/Containers/com.eusoft.dehelper.QuickLook",
    "~/Library/Eudb_de",
    "~/Library/Preferencde/com.eusoft.dehelper.LightPeek.plist",
    "~/Library/Preferencde/com.eusoft.dehelper.plist",
    "~/Library/Preferencde/group.com.eusoft.dehelper.plist",
  ]
end
