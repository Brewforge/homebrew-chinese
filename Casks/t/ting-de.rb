cask "ting-de" do
  version "26.11.1"
  sha256 "e45b78e50d4c95cca6f79f784d1a0f0032c0945dafad1824a4a590af27525b56"

  url "https://static.frdic.com/pkg/ting_de/ting_de.dmg?v=#{version}",
      user_agent: :fake
  name "每日德语听力"
  desc "精听细读，更好学德语"
  homepage "https://www.francochinois.com/v4/de/app/ting"

  livecheck do
    url :homepage
    regex(/应用版本：(\d+(\.\d+)+)/i)
  end

  depends_on :macos

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
