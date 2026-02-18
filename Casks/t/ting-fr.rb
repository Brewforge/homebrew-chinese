cask "ting-fr" do
  version "10.2.0"
  sha256 "e30384de6d1e088a762118e6937ddbf5f81e664d487d9908195ab6a0235d2e17"

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
