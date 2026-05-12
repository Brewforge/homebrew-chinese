cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.23.2"
  sha256 arm:   "75ea7ab6951e29c6e2f4305165a7b771e1683567dac3a52350c4fe13b3c8fb93",
         intel: "f99af246e0fe441dbc0c808adc27903356f2629720cf8e3b7f13df201bf7ea2b"

  url "https://github.com/jlcodes99/cockpit-tools/releases/download/v#{version}/Cockpit.Tools_#{version}_#{arch}.dmg"
  name "Cockpit Tools"
  desc "通用 AI IDE 账号管理工具"
  homepage "https://github.com/jlcodes99/cockpit-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
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
