cask "ting-fr" do
  version "25.12.0"
  sha256 "4e5e7e809494a3141435897f6f4ba8052f682453a4426305837808eeecaa1802"

  url "https://static.frdic.com/pkg/ting_fr/ting_fr.dmg?v=#{version}",
      verified:   "static.frdic.com/",
      user_agent: :fake
  name "每日法语听力"
  desc "精听细读，更好学法语"
  homepage "https://www.francochinois.com/v4/fr/app/ting"

  livecheck do
    url "https://eudic.yuque.com/org-wiki-eudic-fxu2ea/mfxd3t/xtg53urhq3rh1vkw"
    regex(/版本号: (\d+(\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "每日法语听力.app"

  zap trash: [
    "~/Library/Application Support/ting_fr",
    "~/Library/Caches/com.eusoft.ting.fr",
    "~/Library/Preferences/com.eusoft.ting.fr.plist",
    "~/Library/Saved Application State/com.eusoft.ting.fr.savedState",
  ]
end
