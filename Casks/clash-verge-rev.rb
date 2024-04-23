cask "clash-verge-rev" do
  arch arm: "aarch64", intel: "x64"

  version "1.6.0"
  sha256 arm:   "3580abad81e21f724193c9a1c3487358f9b3c356946e562b1dcfba6c2aedac73",
         intel: "b09e5f585fc6e83ccc9894a1a433f72943274ab7ca39d90cead582da9e724ec6"

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
