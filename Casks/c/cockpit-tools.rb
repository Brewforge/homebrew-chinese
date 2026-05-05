cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.19"
  sha256 arm:   "f69c028613468c156cd429a2a78be321df12b354b273d7d4c2e9ba4a5caec7c7",
         intel: "61c3e937dd90b11d49935e951165f9f9917d0108a21462e9ba7916964d8e9ad4"

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
