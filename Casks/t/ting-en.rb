cask "ting-en" do
  version "10.2.0"
  sha256 "e4f7e014364a9ee76e0fb5aa433d32510bccce8a1c189877ee82b1476c6859ea"

  url "https://static.frdic.com/pkg/ting_en/ting_en.dmg?v=#{version}",
      verified:   "static.frdic.com/",
      user_agent: :fake
  name "每日英语听力"
  desc "精听细读，更好学英语"
  homepage "https://www.francochinois.com/v4/en/app/ting"

  livecheck do
    url "https://eudic.yuque.com/org-wiki-eudic-fxu2ea/mfxd3t/xtg53urhq3rh1vkw"
    regex(/版本号: (\d+(\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "每日英语听力.app"

  zap trash: [
    "~/Library/Application Support/ting_en",
    "~/Library/Caches/com.eusoft.ting.en",
    "~/Library/Preferences/com.eusoft.ting.en.plist",
    "~/Library/Saved Application State/com.eusoft.ting.en.savedState",
  ]
end
