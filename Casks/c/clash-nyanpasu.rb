cask "clash-nyanpasu" do
  arch arm: "aarch64", intel: "x64"

  version "2.0.0-beta.3"
  sha256 arm:   "97ee903d06b8fb8f35764302717bfd4b19b5a43d5f9b103e9b60fd97173023a1",
         intel: "ad098d088f054c07250f4d06b1397fce3f59b8f9ee774aaa931da047f4a54788"

  url "https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v#{version}/Clash.Nyanpasu_#{version}_#{arch}.dmg"
  name "Clash Nyanpasu"
  desc "Cross-Platform Clash GUI based on Tauri"
  homepage "https://github.com/libnyanpasu/clash-nyanpasu"

  livecheck do
    url :url
    regex(%r{v(\d+(\.\d+)+(-beta\.\d)?)/Clash.Nyanpasu_(\d+(\.\d+)+(-beta\.\d)?)_#{arch}\.dmg$}i)
    strategy :github_latest do |json|
      json["assets"]&.map do |asset|
        match = asset["browser_download_url"]&.match(regex)
        next if match.blank?

        match[1].to_s
      end
    end
  end

  depends_on macos: :monterey

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
