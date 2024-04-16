cask "messauto" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.2"
  sha256 arm:   "b85de6c19a152a3a808c6026cdd8c2d8520c6aeebbdf3765d70d3ebf575108da",
         intel: "46457ae7a66e000aeb3cdbd0e2900e93ac01006a10a99d42de11b09177202a20"

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
