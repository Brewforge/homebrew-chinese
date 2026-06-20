cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.26.4"
  sha256 arm:   "7d1cf67627c9f1e858efdab28a15825fde764bb7cb98082f60224d36472d484f",
         intel: "f9ab662283dcf5dafe9fb5e92f2791b909fa6269c274e16e61657248933786a2"

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
