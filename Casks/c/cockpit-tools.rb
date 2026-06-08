cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.25.5"
  sha256 arm:   "2c360c5aa0fd4d14b1ab989108c72ade0ac8da962770ed9b67b89b3c2b34db3f",
         intel: "d8c121cf9086cca8f192939456e637cd97fd31a6ab3b241fc3b823de9e450ef4"

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
