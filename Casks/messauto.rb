cask "messauto" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.1"
  sha256 arm:   "8d974df1f78fb73848c4d46609b1a556a9add0a4c10b2dc69be3e193d826d649",
         intel: "4886382ab1e3d2765acf134cd4b32fb7f3ff96b90ef407c2110ad1334b763b1d"

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
