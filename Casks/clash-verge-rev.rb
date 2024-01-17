cask "clash-verge-rev" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.9"
  sha256 arm:   "6c4e634d4b9254b10db6d7044e4fcefb93cd788beee53d149746b9a3e7cc32f0",
         intel: "c8b17bf536b5589497481fb393765096079ef2fb4af218e04195bc9edccba295"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v#{version}/Clash.Verge_#{version}_#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "Clash Verge Rev"
  desc "Clash Verge 接盘项目"
  homepage "https://github.com/clash-verge-rev/clash-verge-rev"

  livecheck do
    url origin.to_s
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
    "~/Library/Application Support/io.github.clash-verge-rev.clash-verge-rev",
    "~/Library/Caches/io.github.clash-verge-rev.clash-verge-rev",
    "~/Library/Preferences/io.github.clash-verge-rev.clash-verge-rev.savedState.plist",
    "~/Library/Saved Application State/io.github.clash-verge-rev.clash-verge-rev.savedState",
    "~/Library/WebKit/io.github.clash-verge-rev.clash-verge-rev",
  ]
end
