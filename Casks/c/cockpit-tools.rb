cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.24.0"
  sha256 arm:   "50f8777676943df3c3b76ddb0d64582d019f13125d62ad1eb98e31ee727f2fae",
         intel: "563ca17a4f75adacd8e37ffd9a0e5cab15f35b014195971ff80f4eafe4e8e8c9"

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
