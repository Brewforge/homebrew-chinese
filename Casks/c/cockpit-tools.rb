cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.63"
  sha256 arm:   "16f727cef3ff743fd3d2de4358259f94be14a5cb0f0b48b04ce2eda828956c71",
         intel: "923e3a7b02c7e90f8ba25ccaf0d507d62638cbe9e99721d84af38b2676fccda8"

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
