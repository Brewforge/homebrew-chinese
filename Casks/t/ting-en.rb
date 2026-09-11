cask "ting-en" do
  version "26.9.1"
  sha256 "9d151943c3c57274612ea61d440c50d42ae3ba3057bc2c760b3fe88e13242a8b"

  url "https://static.frdic.com/pkg/ting_en/ting_en.dmg?v=#{version}",
      user_agent: :fake
  name "每日英语听力"
  desc "精听细读，更好学英语"
  homepage "https://www.francochinois.com/v4/en/app/ting"

  livecheck do
    url :homepage
    regex(/应用版本：(\d+(\.\d+)+)/i)
  end

  depends_on macos: :big_sur

  app "每日英语听力.app"

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/每日英语听力.app"]
  end

  zap trash: [
    "~/Library/Application Support/ting_en",
    "~/Library/Caches/com.eusoft.ting.en",
    "~/Library/Preferences/com.eusoft.ting.en.plist",
    "~/Library/Saved Application State/com.eusoft.ting.en.savedState",
  ]
end
