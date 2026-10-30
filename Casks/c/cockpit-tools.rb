cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.76"
  sha256 arm:   "53e784119be04f312b6ea044b1e38e78bcf352567b2d5436cee77397e471fdda",
         intel: "bf0821e4f598e2541ad7892df08435dc31049f82d79b0aa4571a95a50068571e"

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
