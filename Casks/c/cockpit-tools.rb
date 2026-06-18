cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.26.1"
  sha256 arm:   "a19146186f6ea8f7261c12fa2b288878df252c99298fe51a2bf191956775e483",
         intel: "65f20684224f47d83c5abd071af8e2a770711e8f354e6e843494f3d31d489a18"

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
