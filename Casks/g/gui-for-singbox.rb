cask "gui-for-singbox" do
  arch arm: "arm64", intel: "amd64"

  version "1.27.0"
  sha256 arm:   "47ead32ad2fc0c8418a04b63e41a7fbc56c3489af2cfa5b9251cfb8f08b498db",
         intel: "69678579531b7189e970dba41be5568b32c2e9ec48f02a5eead5c481cef9beee"

  url "https://github.com/GUI-for-Cores/GUI.for.SingBox/releases/download/v#{version}/GUI.for.SingBox-darwin-#{arch}.zip"
  name "GUI.for.SingBox"
  desc "SingBox GUI"
  homepage "https://github.com/GUI-for-Cores/GUI.for.SingBox"

  livecheck do
    url :url
    regex(%r{v(\d+(\.\d+)+(-Alpha)?(-dev\.\d)?)/GUI.for.SingBox-darwin-#{arch}.zip$}i)
    strategy :github_latest do |json|
      json["assets"]&.map do |asset|
        match = asset["browser_download_url"]&.match(regex)
        next if match.blank?

        match[1].to_s
      end
    end
  end

  depends_on :macos

  app "GUI.for.SingBox.app"

  zap trash: [
    "~/Library/Preferences/com.wails.GUI.for.SingBox.plist",
    "~/Library/Saved Application State/com.wails.GUI.for.SingBox.savedState",
    "~/Library/WebKit/com.wails.GUI.for.SingBox",
  ]
end
