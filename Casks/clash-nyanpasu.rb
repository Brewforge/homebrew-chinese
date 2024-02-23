cask "clash-nyanpasu" do
  arch arm: "x64", intel: "x64"

  version "1.4.5"
  sha256 arm:   "0d63a1fa420466b54cb1e669c8415776ac88dba6fc0b1141ccc6ee6386a6a7f9",
         intel: "0d63a1fa420466b54cb1e669c8415776ac88dba6fc0b1141ccc6ee6386a6a7f9"

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
