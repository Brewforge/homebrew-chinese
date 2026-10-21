cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.72"
  sha256 arm:   "ce8a664bce0cbcc40012bbb140ef6e297778023879a15f1fcd44346884c0ca4f",
         intel: "b367817c51b37f52982e04a6ba43c0ad475ba9628b106ce53c8d6563afd9c1de"

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
