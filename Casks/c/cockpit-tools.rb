cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.8"
  sha256 arm:   "109e9b86ca3a9b7e30a7b5c01a7e54d761245bf5c3398fd2041811839a953816",
         intel: "7ab317bed6046d7364108cef70f97619cfd9a43ee3d6dd80fdb6e82117fc8130"

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
