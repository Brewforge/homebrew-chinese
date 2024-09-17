cask "gui-for-singbox" do
  arch arm: "arm64", intel: "amd64"

  version "1.8.5"
  sha256 arm:   "e27b8e01319cfb57414c5c806b1cc23004233ea87ca242e37c04b54d007a7cd6",
         intel: "3465c3bdcad2dd649a11d2d9c162cd4e6edb0b5d458709888e52d91bc988fc02"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/GUI-for-Cores/GUI.for.SingBox/releases/download/v#{version}/GUI.for.SingBox-darwin-#{arch}.zip"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "GUI.for.SingBox"
  desc "SingBox GUI"
  homepage "https://github.com/GUI-for-Cores/GUI.for.SingBox"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true

  app "GUI.for.SingBox.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.wails.GUI.for.SingBox",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/com.wails.GUI.for.SingBox",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/GUI.for.SingBox.lock",
    "~/Library/Caches/com.wails.GUI.for.SingBox",
    "~/Library/Preferences/com.wails.GUI.for.SingBox.plist",
    "~/Library/Saved Application State/com.wails.GUI.for.SingBox.savedState",
    "~/Library/WebKit/com.wails.GUI.for.SingBox",
  ]
end
