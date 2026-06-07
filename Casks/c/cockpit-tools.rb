cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.25.2"
  sha256 arm:   "dc111b05f58950280ab1bc74f5313e008226d09715832171b99c54dd719a20c5",
         intel: "7687150385d8b4de36d914ee2c45259bbc6ed39ed2b8925f5e045c748009545b"

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
