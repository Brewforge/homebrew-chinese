cask "clash-nyanpasu" do
  arch arm: "aarch64", intel: "x64"

  version "1.6.1"
  sha256 arm:   "a4d4ff4e9fbe7ab1a73e151451f0b8b599dd97702e9d5706bb08c2d962bceeac",
         intel: "a4d4ff4e9fbe7ab1a73e151451f0b8b599dd97702e9d5706bb08c2d962bceeac"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/libnyanpasu/releases/download/v#{version}/Clash.Nyanpasu_#{version}_#{arch}.dmg"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "Clash Nyanpasu"
  desc "Cross-Platform Clash GUI based on Tauri"
  homepage "https://github.com/libnyanpasu"

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

  zap trash: "~/.config/clash"
end
