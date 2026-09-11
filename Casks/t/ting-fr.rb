cask "ting-fr" do
  version "26.9.1"
  sha256 "8036fb889e193a23edc5f1021e8cc32d4b416e28fb548fb0acc9489f3deee126"

  url "https://static.frdic.com/pkg/ting_fr/ting_fr.dmg?v=#{version}",
      user_agent: :fake
  name "每日法语听力"
  desc "精听细读，更好学法语"
  homepage "https://www.francochinois.com/v4/fr/app/ting"

  livecheck do
    url :homepage
    regex(/应用版本：(\d+(\.\d+)+)/i)
  end

  depends_on macos: :big_sur

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
