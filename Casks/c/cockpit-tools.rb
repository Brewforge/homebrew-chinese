cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.60"
  sha256 arm:   "eb781c8e734a3724721313116c840fb7cec8364083cddd9f7bfacc1bb751eecc",
         intel: "31580b8dbd2b608b2699f1f35cdec55c155a3d29fefd35e8b448b0a2ee75643e"

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
