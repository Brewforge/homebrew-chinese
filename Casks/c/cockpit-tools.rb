cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.24"
  sha256 arm:   "b344de633300e911d115e00f4814dc485837ce685ef8b00a2203d6ba9fde18ed",
         intel: "8f7d60ad4bdd6969fc02fd691fbcf55f7635e5dd3670a3a791254eb656981977"

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
