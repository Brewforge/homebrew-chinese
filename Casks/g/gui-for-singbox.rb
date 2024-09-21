cask "gui-for-singbox" do
  arch arm: "arm64", intel: "amd64"

  version "1.8.6"
  sha256 arm:   "611bd8cd49809e236a7f973fea4d9b96cbd5af44cd13b03704e677746b517b8c",
         intel: "4348eb6985a2ab2b8eea510a75b002edb48fde0ae7c2cf353467a49f1a79100c"

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
