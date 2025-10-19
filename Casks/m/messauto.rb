cask "messauto" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.0"
  sha256 arm:   "7751aedcbfeddea87064e206eac238dc0beb49d99623ea151d89f3053c179407",
         intel: "50def2d85bcab3ce4eea172760428650dfc952c9588c49cd90bf575fff225754"

  url "https://github.com/LeeeSe/MessAuto/releases/download/v#{version}/MessAuto_#{version}_#{arch}.dmg"
  name "MessAuto"
  desc "自动提取短信和邮箱验证码"
  homepage "https://github.com/LeeeSe/MessAuto/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "MessAuto.app"

  zap trash: [
    "~/Library/Application Support/messauto",
    "~/Library/Preferences/com.doe.messauto.plist",
    "~/Library/Saved Application State/com.doe.messauto.savedState",
  ]
end
