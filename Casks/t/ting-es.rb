cask "ting-es" do
  version "2025-02-25"
  sha256 :no_check

  # static.frdic.com/ was verified as official when first introduced to the cask
  url "https://static.frdic.com/pkg/ting_es/ting_es.dmg",
      verified:   "static.frdic.com/",
      user_agent: :fake
  name "每日西语听力"
  desc "精听细读，更好学西语"
  homepage "http://www.francochinois.com/v4/es/app/ting"

  livecheck do
    url "http://www.francochinois.com/v4/es/app/ting"
    regex(/href=.*?dmg\?ver=(\d+(?:-\d+)*)/i)
  end

  auto_updates true
  depends_on macos: ">= :sierra"

  app "每日西语听力.app"

  zap trash: [
    "~/Library/Application Support/ting_es",
    "~/Library/Caches/com.eusoft.ting.es",
    "~/Library/Preferences/com.eusoft.ting.es.plist",
    "~/Library/Saved Application State/com.eusoft.ting.es.savedState",
  ]
end
