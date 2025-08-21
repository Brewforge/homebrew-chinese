cask "messauto" do
  arch arm: "aarch", intel: "x"

  version "1.1.5"
  sha256 arm:   "82ab5c47dabdc61a8ae1133c5be99470e79cd6863a22718162eb9aedccfb5030",
         intel: "db8eb2f5a19d1f11688f96bca530f908d4004c37355881284271d008bafbf161"

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
