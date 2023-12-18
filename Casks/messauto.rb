cask "messauto" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.3"
  sha256 arm:   "426d3f2682e26d10a85331f11f9309b4282f4ab4d679341630bcd756522b91a7",
         intel: "ab25571a97914715ea5f209e4782067aff3d50355ba9a93c403c0a6b15df8fd5"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/LeeeSe/MessAuto/releases/download/v#{version}/MessAuto_#{arch}.zip"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "MessAuto"
  desc "MacOS app that automatically extracts and pastes and enters SMS verification codes."
  homepage "https://github.com/LeeeSe/MessAuto"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true
  app "MessAuto.app"

  zap trash: [
    "~/Library/Preferences/com.doe.messauto.plist",
  ]
end
