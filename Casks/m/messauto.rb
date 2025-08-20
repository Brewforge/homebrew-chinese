cask "messauto" do
  arch arm: "aarch", intel: "x"

  version "1.1.4"
  sha256 arm:   "aedc639b7949a9d90ca420977994d0f8da14d8eb315b0b48fd0cdf8247d9d417",
         intel: "16fcdd4c025f441673420e6848b5c3edc6caecb0d3437eae29044025e01fde7a"

  url "https://github.com/LeeeSe/MessAuto/releases/download/v#{version}/MessAuto_#{version}_#{arch}64.dmg",
      verified: "github.com/LeeeSe/MessAuto/"
  name "MessAuto"
  desc "自动提取Mac平台的短信和邮箱验证码"
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
