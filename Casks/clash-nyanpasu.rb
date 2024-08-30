cask "clash-nyanpasu" do
  arch arm: "x64", intel: "x64"

  version "1.6.0"
  sha256 arm:   "2f1e8d773097c1c61ffa0d1be6c4cbfa9a2d71745cc0d9ac8ed5215a4267b7a4",
         intel: "2f1e8d773097c1c61ffa0d1be6c4cbfa9a2d71745cc0d9ac8ed5215a4267b7a4"

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

  caveats do
    requires_rosetta
  end
end
