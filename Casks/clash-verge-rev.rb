cask "clash-verge-rev" do
  arch arm: "aarch64", intel: "x64"

  version "1.6.5"
  sha256 arm:   "911a1797d2762fb59e75d35a9798cd69ad1749d6200898d55adbc5deef1d271e",
         intel: "98642ee60bb6b9e2944432d333a22598f2cff8ed1cf67d1cb5d87c94b94cd299"

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
