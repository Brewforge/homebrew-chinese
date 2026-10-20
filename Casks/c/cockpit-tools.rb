cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.71"
  sha256 arm:   "7d5c8b435f6b8ad8bd86fad5c1ca9b947b0fbd17c82b71aa2aaab49a0150e188",
         intel: "41a787dadedfcbec0319a6a1491ff320677b938887966c5292e929aa713a1c64"

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
