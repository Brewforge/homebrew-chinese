cask "messauto" do
  arch arm: "aarch", intel: "x"

  version "1.2.1"
  sha256 arm:   "0203b4479ff4974b2fc2404970f35c00fa64f6dc00aa73198205243f9fa03e77",
         intel: "50f51f0d83bef007dee27f13b479131e649ec7be42449e3c20b5eaa9c691a8ec"

  url "https://github.com/LeeeSe/MessAuto/releases/download/v#{version}/MessAuto_#{version}_#{arch}64.dmg"
  name "MessAuto"
  desc "自动提取短信和邮箱验证码"
  homepage "https://github.com/LeeeSe/MessAuto/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "MessAuto.app"

  zap trash: [
    "~/Library/Application Support/messauto",
    "~/Library/Preferences/com.doe.messauto.plist",
    "~/Library/Saved Application State/com.doe.messauto.savedState",
  ]
end
