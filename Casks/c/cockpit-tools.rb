cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.21"
  sha256 arm:   "47c0b9272f1c9f0bfbe2e1f2ce6c18976a1629010a3e1e24f5633d149dd33e5b",
         intel: "f7f2c98dc4ec01aaab586ed110fe4e94dfc5eed78e069a0d6302584f601efd76"

  url "https://github.com/jlcodes99/cockpit-tools/releases/download/v#{version}/Cockpit.Tools_#{version}_#{arch}.dmg"
  name "Cockpit Tools"
  desc "通用 AI IDE 账号管理工具"
  homepage "https://github.com/jlcodes99/cockpit-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :monterey"

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
