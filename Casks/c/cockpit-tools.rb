cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.0"
  sha256 arm:   "9af8d97705f061d8ce95db18aee834a09b81c1319f4a2e94b98d138cdcb4fce5",
         intel: "40a8614834beff8508211dac6add7aebd95530fc44d1a0e3e1cd5c0e061e71e0"

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
