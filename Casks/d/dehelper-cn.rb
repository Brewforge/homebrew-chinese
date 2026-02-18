cask "dehelper-cn" do
  version "11.6.0"
  sha256 "663bb4c3cdd8cdbfc6a7b84248f79220fa781b881c0a99381bc3a41ae2164b2a"

  url "https://static.eudic.net/pkg/dhmac.dmg?v=#{version}",
      user_agent: :fake
  name "Dehelper"
  name "德语助手"
  desc "德语学习者必备的工具"
  homepage "https://www.eudic.net/v4/de/app/dehelper"

  livecheck do
    url "https://eudic.yuque.com/org-wiki-eudic-fxu2ea/mfxd3t/tqq00bp7a8p2y1gu"
    regex(/版本号: (\d+(\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Dehelper.app"

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
