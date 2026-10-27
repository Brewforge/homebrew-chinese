cask "clash-nyanpasu" do
  arch arm: "aarch64", intel: "x64"

  version "2.0.0"
  sha256 arm:   "1bb57b7ebcda65e5edf23463e09308a0c7154eb6609104ed4f6ade5def72b3c1",
         intel: "14d11c3b9de0a4b843d36cd5843bd97b08a5211005866367e38c80b448ffc92d"

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
