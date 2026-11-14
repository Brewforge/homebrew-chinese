cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.83"
  sha256 arm:   "efe9aec68cc8c71077399daca71e729dd527a1e10dee72eb44ab0989638b3870",
         intel: "e71d8d66ba4be85190eddc36551c281733bfce3d2e64526802c41d35727886eb"

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
