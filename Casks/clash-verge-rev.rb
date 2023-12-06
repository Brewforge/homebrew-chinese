cask "clash-verge-rev" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.3"
  sha256 arm:   "8c8175b10c1db2612d542ea0aee7bc6a12377817f6d0c1ecbfd2e64e18f02ad8",
         intel: "8878e00ad911d8a1884d78406c48626f79ee0bf90c6bcdd6f74d398346f36278"

  url "https://github.com/wonfen/clash-verge-rev/releases/download/v#{version}/Clash.Verge_#{version}_#{arch}.dmg"
  name "Clash Verge Rev"
  desc "Clash Verge 接盘项目"
  homepage "https://github.com/wonfen/clash-verge-rev"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "clash-verge"

  app "Clash Verge.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Clash Verge.app"]
  end

  zap trash: [
    "~/.config/clash-verge",
    "~/Library/Caches/msedge_crashpad_handler",
    "~/Library/Preferences/moe.elaina.clash.verge.plist",
    "~/Library/Saved Application State/moe.elaina.clash.verge.savedState",
  ]
end
