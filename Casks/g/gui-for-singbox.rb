cask "gui-for-singbox" do
  arch arm: "arm64", intel: "amd64"

  version "1.24.1"
  sha256 arm:   "b0cc6e79d31d8ec279d9a2c6701ebf9816fcb27e5637600431ae49faa09f299c",
         intel: "f7412244c2b1f29a669bc152c34b10e1aca357de280b13bd512624a50e7f193b"

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

  auto_updates true
  depends_on :macos

  app "GUI.for.SingBox.app"

  zap trash: [
    "~/Library/Preferences/com.wails.GUI.for.SingBox.plist",
    "~/Library/Saved Application State/com.wails.GUI.for.SingBox.savedState",
    "~/Library/WebKit/com.wails.GUI.for.SingBox",
  ]
end
