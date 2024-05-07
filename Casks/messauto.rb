cask "messauto" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.4"
  sha256 arm:   "509c9874103c012fd363407e056b553734dd998ca38000b7215de3eb8e101348",
         intel: "e3cac10cab9a9fe71a350759980ed9687c1d479cda43867ce5f8805db6b1e49c"

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
