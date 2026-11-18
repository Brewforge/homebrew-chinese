cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.2"
  sha256 arm:   "62be1089644a1376b1eb603aa8a971503428be6ffd56fe3b577b4a5fdd2e413c",
         intel: "e239a3d279c162f26393b60ec7d3f8aa6729a06e5e3831faf7d065b971501832"

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

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/Cockpit Tools.app"]
  end

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
