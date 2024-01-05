cask "jan" do
  arch arm: "arm64", intel: "x64"

  version "0.4.3"
  sha256 arm:   "785d60a6967b1c0a34c766a3021b6b6899e9cef2be3790c9c61b14ec1b993670",
         intel: "248491ca7243da8d9077fd60c9f9da6f6cba86dc3a66d4629258d62d208d8b0c"

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
    "~/Library/Saved Application State/jan.ai.app.savedState"
  ]
end
