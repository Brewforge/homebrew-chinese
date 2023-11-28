cask "upscayl" do
  version "2.8.6"
  sha256 "85c25f7d1fa0e3c66ae0de06886e746fa040f6416bd0e9903ab1e2744922c04f"

  url "https://github.com/upscayl/upscayl/releases/download/v#{version}/upscayl-#{version}-mac.dmg",
      verified: "github.com/upscayl/upscayl/"
  name "Upscayl"
  desc "Linux-first FOSS AI image upscaler"
  homepage "https://www.upscayl.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Upscayl.app"

  zap trash: [
    "~/Library/Application Support/Upscayl",
    "~/Library/Saved Application State/org.upscayl.app.savedState",
    "~/Library/Preferences/org.upscayl.app.plist",
  ]
end
