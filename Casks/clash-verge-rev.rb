cask "clash-verge-rev" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.1"
  sha256 arm:   "1643c83ef7b7c3a7e8389a47c79c7e1bd3b6ac14660800d0b4506a0fb8f44332",
         intel: "e9ea6e9ffd35dc53baa05d29e6fca001f6ea6aaa074906509c9b09ea216e066a"

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
