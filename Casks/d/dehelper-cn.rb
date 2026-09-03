cask "dehelper-cn" do
  version "26.9.0"
  sha256 "f0631d1f43ddc8395afd1330b1c5ae798ba763383e3ea818b8de998256faac62"

  url "https://static.eudic.net/pkg/dhmac.dmg?v=#{version}",
      user_agent: :fake
  name "Dehelper"
  name "德语助手"
  desc "德语学习者必备的工具"
  homepage "https://www.eudic.net/v4/de/app/dehelper"

  livecheck do
    url :homepage
    regex(/应用版本：(\d+(\.\d+)+)/i)
  end

  depends_on macos: :ventura

  app "Dehelper.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Dehelper.app"]
  end

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
