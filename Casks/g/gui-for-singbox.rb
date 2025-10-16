cask "gui-for-singbox" do
  arch arm: "arm64", intel: "amd64"

  version "1.13.0"
  sha256 arm:   "bdff9b48173c67516cbcb78c7e37848429084520d2183d1dbe3ac2254be3d249",
         intel: "d4730f0cefeb43be728cfa25301707dca29c02263cc24d958060c0da1500ae9e"

  url "https://github.com/GUI-for-Cores/GUI.for.SingBox/releases/download/v#{version}/GUI.for.SingBox-darwin-#{arch}.zip"
  name "GUI.for.SingBox"
  desc "SingBox GUI"
  homepage "https://github.com/GUI-for-Cores/GUI.for.SingBox"

  livecheck do
    url :url
    regex(%r{v(\d+(\.\d+)+(-Alpha)?)/GUI.for.SingBox-darwin-#{arch}.zip$}i)
    strategy :github_latest do |json|
      json["assets"]&.map do |asset|
        match = asset["browser_download_url"]&.match(regex)
        next if match.blank?

        match[1].to_s
      end
    end
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
