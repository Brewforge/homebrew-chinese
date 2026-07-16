cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.6"
  sha256 arm:   "18d280e16d25ed37ab34d34d6b4e62201c2a5033a0eb6467e6f4fb258aea0877",
         intel: "6890db999835313572c340c1975c8012d4860aea639dcfb09cd6e63260bc8b4c"

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
