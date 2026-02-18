cask "ting-es" do
  version "25.12.0"
  sha256 "946bfbb335b831c98eecbd89e1dcffc3291eb0fcc9532985c5b378648ed48985"

  url "https://static.frdic.com/pkg/ting_es/ting_es.dmg?v=#{version}",
      verified:   "static.frdic.com/",
      user_agent: :fake
  name "每日西语听力"
  desc "精听细读，更好学西语"
  homepage "https://www.francochinois.com/v4/es/app/ting"

  livecheck do
    url "https://eudic.yuque.com/org-wiki-eudic-fxu2ea/mfxd3t/xtg53urhq3rh1vkw"
    regex(/版本号: (\d+(\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "每日西语听力.app"

  zap trash: [
    "~/Library/Application Support/ting_es",
    "~/Library/Caches/com.eusoft.ting.es",
    "~/Library/Preferences/com.eusoft.ting.es.plist",
    "~/Library/Saved Application State/com.eusoft.ting.es.savedState",
  ]
end
