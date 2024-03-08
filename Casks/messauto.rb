cask "messauto" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.4"
  sha256 arm:   "8ff3f4352f064ad29783d74842d1f6a2dbc347109447ce5793c69d8a42a0db49",
         intel: "9441a0dbe24802c3ac28064626b3fcb29519eaec3eb1094b48fd4d972cba1f95"

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
