cask "anymo" do
  arch arm: "arm64", intel: "x64"

  version "2.7.12"
  sha256 :no_check

  url "https://anymoweb.com/app-mac-#{arch}.dmg"
  name "Anymo"
  desc "终身受用的抗遗忘卡片记忆笔记"
  homepage "https://anymoweb.com/"

  livecheck do
    url "https://anymoweb.com/app_client/latest.yml"
    regex(/version:\s*"?(\d+(?:\.\d+)+)"?/i)
  end

  depends_on macos: :catalina

  app "Anymo.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Anymo.app"]
  end

  zap trash: [
    "~/Library/Application Support/Anymo",
    "~/Library/Preferences/com.memo93.anymodesktop.plist",
  ]
end
