cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.28"
  sha256 arm:   "74cbc2bf322bf8c8c8a09cde5da908378f5e45afb54980b08496b00995fe1020",
         intel: "e3ace1fe877f253f8b244bab796e4f20f9cef920f00f62057988083601217ccd"

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
