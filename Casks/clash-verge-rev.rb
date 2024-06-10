cask "clash-verge-rev" do
  arch arm: "aarch64", intel: "x64"

  version "1.6.5"
  sha256 arm:   "10a88bdfcba942cb53567bc89efdc9f7cf1a5ed43437460f7e9c8f1d6de1bc80",
         intel: "6810c7f697c6ccbd6d38ac2ac3194d759c1ba97041cb217b6dfa8470af3ae069"

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

  auto_updates true
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
