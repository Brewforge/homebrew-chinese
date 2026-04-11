cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.21.1"
  sha256 arm:   "d738db655ee2d9aa4c8b1c524cba4dfa8145b4a71d33b2c60f0c9914d310eb58",
         intel: "ae802eb8844e75819df53b5459e596633886a76aaed898a5d226c45bba519480"

  url "https://github.com/jlcodes99/cockpit-tools/releases/download/v#{version}/Cockpit.Tools_#{version}_#{arch}.dmg"
  name "Cockpit Tools"
  desc "通用 AI IDE 账号管理工具"
  homepage "https://github.com/jlcodes99/cockpit-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Cockpit Tools.app"

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
