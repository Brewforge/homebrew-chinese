cask "ting-es" do
  version "26.11.1"
  sha256 "13c222cb17fcbd7419fe561b28b77ca80033dd8d76e71170da346359e3122465"

  url "https://static.frdic.com/pkg/ting_es/ting_es.dmg?v=#{version}",
      user_agent: :fake
  name "每日西语听力"
  desc "精听细读，更好学西语"
  homepage "https://www.francochinois.com/v4/es/app/ting"

  livecheck do
    url :homepage
    regex(/应用版本：(\d+(\.\d+)+)/i)
  end

  depends_on :macos

  app "每日西语听力.app"

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/每日西语听力.app"]
  end

  zap trash: [
    "~/Library/Application Support/ting_es",
    "~/Library/Caches/com.eusoft.ting.es",
    "~/Library/Preferences/com.eusoft.ting.es.plist",
    "~/Library/Saved Application State/com.eusoft.ting.es.savedState",
  ]
end
