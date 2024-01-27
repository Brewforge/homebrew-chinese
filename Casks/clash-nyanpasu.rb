cask "clash-nyanpasu" do
  arch arm: "x64", intel: "x64"

  version "1.4.3"
  sha256 arm:   "31cca0554ac5569a919e6bd6d212c0492c1bdc6d4a7f7f5f94c2a0cc3e45c359",
         intel: "31cca0554ac5569a919e6bd6d212c0492c1bdc6d4a7f7f5f94c2a0cc3e45c359"

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

  zap trash: "~/.config/clash"
end
