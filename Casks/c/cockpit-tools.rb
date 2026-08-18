cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.22"
  sha256 arm:   "cc60dd4de903ee2a566ff6f1d50c937fba24d898b58e6b1406cc91199c6ed283",
         intel: "a7f37dc52ec60e7e9b1327b9e2622c09fa58059f51ae76eb23267d1bc5078e0c"

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
