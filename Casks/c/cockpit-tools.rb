cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.23.5"
  sha256 arm:   "4f365f7bb2ca70c103473d50a3029a671e8632711751138b09fa3deb10f68785",
         intel: "f278b1dbfd23726d72277855624e9b338088d9d87f8ddefef962d1ca34998c64"

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
