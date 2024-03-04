cask "clash-nyanpasu" do
  arch arm: "x64", intel: "x64"

  version "1.5.0"
  sha256 arm:   "50bf53ec543791713cda490f56f48f333a74f250f87afec218f69b3b4b4d4773",
         intel: "50bf53ec543791713cda490f56f48f333a74f250f87afec218f69b3b4b4d4773"

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
