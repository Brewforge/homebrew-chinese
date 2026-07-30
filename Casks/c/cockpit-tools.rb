cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.15"
  sha256 arm:   "b342b479fc216c017faefe3a0f7ef7bc19eb3ffdf6f87a75ca68e900000cf44d",
         intel: "cf7c1a3894022ffd3403423f5c5357ed7decf711d13d6385e2ce0c46a662cc80"

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

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Cockpit Tools.app"]
  end

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
