cask "clash-nyanpasu" do
  arch arm: "aarch64", intel: "x64"

  version "1.6.1"
  sha256 arm:   "97ee903d06b8fb8f35764302717bfd4b19b5a43d5f9b103e9b60fd97173023a1",
         intel: "a4d4ff4e9fbe7ab1a73e151451f0b8b599dd97702e9d5706bb08c2d962bceeac"

  url "https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v#{version}/Clash.Nyanpasu_#{version}_#{arch}.dmg"
  name "Clash Nyanpasu"
  desc "Cross-Platform Clash GUI based on Tauri"
  homepage "https://github.com/libnyanpasu/clash-nyanpasu"

  livecheck do
    url :url
    regex(%r{v(\d+(\.\d+)+(-beta\.\d)?)/Clash.Nyanpasu_(\d+(\.\d+)+(-beta\.\d)?)-aarch64\.zip$}i)
    strategy :github_latest do |json|
      json["assets"]&.map do |asset|
        match = asset["browser_download_url"]&.match(regex)
        next if match.blank?

        "#{match[1]},#{match[4]}"
      end
    end
  end

  depends_on :macos

  app "Clash Nyanpasu.app"

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/Clash Nyanpasu.app"]
  end

  zap trash: [
    "~/Library/Application Support/Clash Nyanpasu",
    "~/Library/Caches/moe.elaina.clash.nyanpasu",
    "~/Library/Saved Application State/moe.elaina.clash.nyanpasu.savedState",
    "~/Library/WebKit/moe.elaina.clash.nyanpasu",
  ]
end
