cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.24.11"
  sha256 arm:   "e1897fa9e938a885845979d0ce0b55cadd10c1cb4d4aae4c77ccab01601ebf3c",
         intel: "f0ea5aed8af2eafab04237428f5e03828c534d1332a94cb236d360d2b8a80de4"

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
