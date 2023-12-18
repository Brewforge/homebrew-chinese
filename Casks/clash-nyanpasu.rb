cask "clash-nyanpasu" do
  arch arm: "x64", intel: "x64"

  version "1.4.1"
  sha256 arm:   "c4c28b1d5cc798f8cfca02f6408c13710022b43fe3205f5950a094c2e5bb145f",
         intel: "c4c28b1d5cc798f8cfca02f6408c13710022b43fe3205f5950a094c2e5bb145f"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/keiko233/clash-nyanpasu/releases/download/v#{version}/Clash.Nyanpasu_#{version}_#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "Clash Nyanpasu"
  desc "Cross-Platform Clash GUI based on Tauri"
  homepage "https://github.com/keiko233/clash-nyanpasu"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  conflicts_with cask: "clash-verge"

  app "Clash Nyanpasu.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Clash Nyanpasu.app"]
  end

  zap trash: [
    "~/.config/clash",
  ]
end
