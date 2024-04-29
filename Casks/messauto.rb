cask "messauto" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.3"
  sha256 arm:   "fe2263e8b2bc5f64a282ae9ade4045e5b18dcdab820f6697eca14fc1013659f6",
         intel: "a97978296be6c4d503b958903b2849f5cf42b03e6799ba3a776602f5a07a6322"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/LeeeSe/MessAuto/releases/download/v#{version}/MessAuto_#{arch}.zip"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "MessAuto"
  desc "Automatically extracts and pastes and enters SMS verification codes"
  homepage "https://github.com/LeeeSe/MessAuto"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true

  app "MessAuto.app"

  zap trash: "~/Library/Preferences/com.doe.messauto.plist"
end
