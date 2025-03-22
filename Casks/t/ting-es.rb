cask "ting-es" do
  version "2025-03-11"
  sha256 "2bbbd11266417bf99b0eb0e9240a48b9369a66688779d37dbcdc2a0bc579664a"

  url "https://static.frdic.com/pkg/ting_es/ting_es.dmg?v=#{version}",
      verified:   "static.frdic.com/",
      user_agent: :fake
  name "每日西语听力"
  desc "精听细读，更好学西语"
  homepage "http://www.francochinois.com/v4/es/app/ting"

  livecheck do
    url "http://www.francochinois.com/v4/es/app/ting"
    regex(/应用版本：(\d+(\.\d+)+)/i)
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
