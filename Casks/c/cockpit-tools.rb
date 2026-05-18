cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.23.9"
  sha256 arm:   "cbba8ef701de94e4b3d61e693f858f36c5a2829d57cef4ba4a80e359bda73eaf",
         intel: "8f393994c3b7ce4cd5b22a9f7237a6928cea3137985f198566e7ae46a47c5a2e"

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
