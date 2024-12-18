cask "clash-nyanpasu" do
  arch arm: "aarch64", intel: "x64"

  version "1.6.1"
  sha256 arm:   "bcee837286a58eb786230115d53a0f69448b22cc126621b811cb147f98f03034",
         intel: "a4d4ff4e9fbe7ab1a73e151451f0b8b599dd97702e9d5706bb08c2d962bceeac"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v#{version}/Clash.Nyanpasu_#{version}_#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "Clash Nyanpasu"
  desc "Cross-Platform Clash GUI based on Tauri"
  homepage "https://github.com/libnyanpasu/clash-nyanpasu"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true

  app "Clash Nyanpasu.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Clash Nyanpasu.app"]
  end

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/moe.elaina.clash.nyanpasu",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/moe.elaina.clash.nyanpasu",
    "~/Library/Application Support/Clash Nyanpasu",
    "~/Library/Caches/moe.elaina.clash.nyanpasu",
    "~/Library/Saved Application State/moe.elaina.clash.nyanpasu.savedState",
    "~/Library/WebKit/moe.elaina.clash.nyanpasu",
  ]
end
