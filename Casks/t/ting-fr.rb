cask "ting-fr" do
  version "26.11.1"
  sha256 "c134b9d395d2fd7855046d335ca1c7ee38b5dc53c63bd014fcfc460689286e79"

  url "https://static.frdic.com/pkg/ting_fr/ting_fr.dmg?v=#{version}",
      user_agent: :fake
  name "每日法语听力"
  desc "精听细读，更好学法语"
  homepage "https://www.francochinois.com/v4/fr/app/ting"

  livecheck do
    url :homepage
    regex(/应用版本：(\d+(\.\d+)+)/i)
  end

  depends_on :macos

  app "每日法语听力.app"

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/每日法语听力.app"]
  end

  zap trash: [
    "~/Library/Application Support/ting_fr",
    "~/Library/Caches/com.eusoft.ting.fr",
    "~/Library/Preferences/com.eusoft.ting.fr.plist",
    "~/Library/Saved Application State/com.eusoft.ting.fr.savedState",
  ]
end
