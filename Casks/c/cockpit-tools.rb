cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.35"
  sha256 arm:   "2372dd3342e2305abeb2ab7fcec0366838b3daa43b72ad8bae4c10e0ba89ff40",
         intel: "32ca23bafab166a5ab904963037598ca49242d3dd7d98032a323d747f79f51fc"

  url "https://github.com/jlcodes99/cockpit-tools/releases/download/v#{version}/Cockpit.Tools_#{version}_#{arch}.dmg"
  name "Cockpit Tools"
  desc "通用 AI IDE 账号管理工具"
  homepage "https://github.com/jlcodes99/cockpit-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Cockpit Tools.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Cockpit Tools.app"]
  end

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
