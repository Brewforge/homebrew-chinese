cask "gui-for-singbox" do
  arch arm: "arm64", intel: "amd64"

  version "1.22.0"
  sha256 arm:   "17a2e337bc7b043205f386c7003dff5dffc5296a0252d9a72434346461f912b5",
         intel: "74af0642bda1cbdb1a6789a7f92b581434d640ec3c1780a496f32709e1331349"

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

  app "GUI.for.SingBox.app"

  zap trash: [
    "~/Library/Preferences/com.wails.GUI.for.SingBox.plist",
    "~/Library/Saved Application State/com.wails.GUI.for.SingBox.savedState",
    "~/Library/WebKit/com.wails.GUI.for.SingBox",
  ]
end
