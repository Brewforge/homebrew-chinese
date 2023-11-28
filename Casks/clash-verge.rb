cask "clash-verge" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.8"
  sha256 arm:   "fd8370323a695a8828d1a7487c9e74200ce36b51b324495bfba21498c6fc8c48",
         intel: "4cb0c3a0abc333af7f3253b9e2700d480128587607e072554c74db4f1ec23df4"

  url "https://github.com/zzzgydi/clash-verge/releases/download/v#{version}/Clash.Verge_#{version}_#{arch}.dmg"
  name "Clash Verge"
  desc "Cross-Platform Clash GUI based on Tauri"
  homepage "https://github.com/zzzgydi/clash-verge"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "clash-verge-rev"

  app "Clash Verge.app"

  preflight do
    system_command "xattr",
                    args: ["-cr", "#{staged_path}/Clash Verge.app"]
  end

  zap trash: [
    "~/.config/clash-verge",
    "~/Library/Caches/top.gydi.clashverge",
    "~/Library/Preferences/top.gydi.clashverge.plist",
    "~/Library/Saved Application State/top.gydi.clashverge.savedState",
  ]
end
