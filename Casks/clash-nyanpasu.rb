cask "clash-nyanpasu" do
  arch arm: "x64", intel: "x64"

  version "1.4.4"
  sha256 arm:   "7c67e20a6ec415ae8fa90b2df1b20e1de04c8955421259685eb2f8af6079a951",
         intel: "7c67e20a6ec415ae8fa90b2df1b20e1de04c8955421259685eb2f8af6079a951"

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
