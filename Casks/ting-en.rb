cask "ting-en" do
  version "2023-10-12"
  sha256 :no_check

  # static.frdic.com/ was verified as official when first introduced to the cask
  url "https://static.frdic.com/pkg/ting_en/ting_en.dmg",
      verified:   "static.frdic.com/",
      user_agent: :fake
  name "每日英语听力"
  homepage "http://www.francochinois.com/v4/en/app/ting"

  livecheck do
    url "http://www.francochinois.com/v4/en/app/ting"
    regex(/href=.*?dmg\?ver=(\d+(?:-\d+)*)/i)
  end

  auto_updates true
  depends_on macos: ">= :sierra"

  app "每日英语听力.app"

  zap trash: [
    "~/Library/Application Support/ting_en",
    "~/Library/Caches/com.eusoft.ting.en",
    "~/Library/Preferences/com.eusoft.ting.en.plist",
    "~/Library/Saved Application State/com.eusoft.ting.en.savedState",
  ]
end
