cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.24.9"
  sha256 arm:   "b4bc26893c6e348166014cfddaf989a4c3f40ec142d83968f24aff8af8e29d40",
         intel: "e49eb6639caad5c5f2dd3dd2a17a6dbcb453ac562dfc88d6bb17d60e85bb585e"

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
