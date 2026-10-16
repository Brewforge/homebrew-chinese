cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.69"
  sha256 arm:   "6be9b6104d911ec491b777ddb62841d4e2f1bfb4bba068d40f3d07a7ea5eb5a0",
         intel: "7c5666cae66a192e728308424c649295051ce6633c2f64ce314f45df998eb882"

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
