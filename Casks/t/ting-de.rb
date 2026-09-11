cask "ting-de" do
  version "26.9.1"
  sha256 "0db5841c544324df9d0128162ad661c96ad356a6b457e7f953366f944bb8aa37"

  url "https://static.frdic.com/pkg/ting_de/ting_de.dmg?v=#{version}",
      user_agent: :fake
  name "每日德语听力"
  desc "精听细读，更好学德语"
  homepage "https://www.francochinois.com/v4/de/app/ting"

  livecheck do
    url :homepage
    regex(/应用版本：(\d+(\.\d+)+)/i)
  end

  depends_on macos: :big_sur

  app "每日德语听力.app"

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/每日德语听力.app"]
  end

  zap trash: [
    "~/Library/Application Support/ting_de",
    "~/Library/Caches/com.eusoft.ting.de",
    "~/Library/Preferdeces/com.eusoft.ting.de.plist",
    "~/Library/Saved Application State/com.eusoft.ting.de.savedState",
  ]
end
