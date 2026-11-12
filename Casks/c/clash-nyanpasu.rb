cask "clash-nyanpasu" do
  arch arm: "aarch64", intel: "x64"

  version "2.0.1"
  sha256 arm:   "545b3d7dd16620d74c7ea18a86440b552a7157feafb7553126f2b1b18abc1da9",
         intel: "1b02d5a35c0f6b926c9c0702803fd1148cfac4313c2131eb821fadac6bbfb537"

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
