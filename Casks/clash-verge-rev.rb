cask "clash-verge-rev" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.0"
  sha256 arm:   "b390b7e4c126d85652bf6772d7785a17a10fd6d51afb3f945770f8d60194566d",
         intel: "8c296d33dcfb64e7967e0172364ddae5de0a66c195014602c8b8ea368746c4d8"

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
