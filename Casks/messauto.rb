cask "messauto" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.7.0"
  sha256 arm:   "08add0bcea1b5c4cbb1176e51ce60b966bcbc75741b1a8215b7c4ef3069c927b",
         intel: "8f7801e57b6eb9fb89f793689811dc7e9f7ef19633401abf51c5a97dc8f8e5a0"

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
