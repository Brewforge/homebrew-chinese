cask "messauto" do
  arch arm: "aarch", intel: "x"

  version "1.2.0"
  sha256 arm:   "94d97a0b73e598bcd7727577c5bce6a5cd758b3e340b739be2232fdc6338850a",
         intel: "9e91afb13de11fb1aa8a1cf710d901711fc056dc7b0b2329f8251df7e7395d5f"

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
