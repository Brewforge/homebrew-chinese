cask "ting-de" do
  version "10.2.0"
  sha256 "a89029d7a4fd8b4c718777a820f4e3f59fc3b80e89da5dacd05cfc8a9f7884b8"

  url "https://static.frdic.com/pkg/ting_de/ting_de.dmg?v=#{version}",
      verified:   "static.frdic.com/",
      user_agent: :fake
  name "每日德语听力"
  desc "精听细读，更好学德语"
  homepage "http://www.francochinois.com/v4/de/app/ting"

  livecheck do
    url "http://www.francochinois.com/v4/de/app/ting"
    regex(/应用版本：(\d+(\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :sierra"

  app "每日德语听力.app"

  zap trash: [
    "~/Library/Application Support/ting_de",
    "~/Library/Caches/com.eusoft.ting.de",
    "~/Library/Preferdeces/com.eusoft.ting.de.plist",
    "~/Library/Saved Application State/com.eusoft.ting.de.savedState",
  ]
end
