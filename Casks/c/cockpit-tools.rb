cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.68"
  sha256 arm:   "bf328131df468b7d89e6474840ad34c962c8c8d936c5403fc9d74afe9f6ed03b",
         intel: "5b9b9adea82c636ff1060e3705d1bcc62d4eb5476b1539c00e73c181d7668ac0"

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
