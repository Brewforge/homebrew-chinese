cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.64"
  sha256 arm:   "238331b8108b0a7b29716ad172e25d651989a71a879cd04453d4ed2deb51b53a",
         intel: "a51f7625cb941ab8a59c3fcb7e0b5d91518d16c496bcde3731a5dd35dc560e3c"

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

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/Cockpit Tools.app"]
  end

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
