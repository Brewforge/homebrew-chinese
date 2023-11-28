cask "clash-nyanpasu" do
  arch arm: "x64", intel: "x64"

  version "1.4.0"
  sha256 arm:   "128ea4cfa89e000a83d8d7556f26dad6f5199ee9b507712fb496e2e406f03caa",
         intel: "128ea4cfa89e000a83d8d7556f26dad6f5199ee9b507712fb496e2e406f03caa"

  url "https://github.com/keiko233/clash-nyanpasu/releases/download/v#{version}/Clash.Nyanpasu_#{version}_#{arch}.dmg"
  name "Clash Nyanpasu"
  desc "Cross-Platform Clash GUI based on Tauri"
  homepage "https://github.com/keiko233/clash-nyanpasu"

  livecheck do
    url :url
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
