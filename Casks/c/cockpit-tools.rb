cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.14"
  sha256 arm:   "e614f54ce009b2fbb565e2f8bb213bfd90c8a4bdf4295d4d3747468cc8bb7919",
         intel: "d602253e02bcba842051dcc08632290057cfcd5d166b3958ed4b1e3eeb92d9b5"

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

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Cockpit Tools.app"]
  end

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
