cask "jan" do
  arch arm: "arm64", intel: "x64"

  version "0.4.4"
  sha256 arm:   "73f5e3448ff6c0bfc6e1e4f182c437bc76721adfc79888322747b43dd7a197d6",
         intel: "6c8da481ecfe4655e9b97bee1e09057ca5ff7fa6a300ce1abb0d4e9dcc827a68"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/janhq/jan/releases/download/v#{version}/jan-mac-#{arch}-#{version}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "jan"
  desc "Open Source Alternative To Chatgpt that Runs 100% Offline on Your Computer"
  homepage "https://github.com/janhq/jan/"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true

  app "jan.app"

  zap trash: [
    "~/Library/Application Support/jan",
    "~/Library/Preferences/jan.ai.app.plist",
    "~/Library/Saved Application State/jan.ai.app.savedState",
  ]
end
