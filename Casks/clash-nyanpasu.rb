cask "clash-nyanpasu" do
  arch arm: "x64", intel: "x64"

  version "1.5.1"
  sha256 arm:   "f2459742d58cb2f991fe3f396728c8c1879a072212a706af9e2a7cbea6fae3a5",
         intel: "f2459742d58cb2f991fe3f396728c8c1879a072212a706af9e2a7cbea6fae3a5"

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

  auto_updates true
  conflicts_with cask: "clash-verge"

  app "Clash Nyanpasu.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Clash Nyanpasu.app"]
  end

  zap trash: "~/.config/clash"
end
