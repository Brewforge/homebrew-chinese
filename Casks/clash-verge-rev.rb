cask "clash-verge-rev" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.2"
  sha256 arm:   "b59cdef6ed42aa49d9182c99b53e3c97383ef6541f60d0cc27a1bf0022e2cb26",
         intel: "466b6763a281d865e519f1e02b3cd83ce993d017994928038a03a0bdd9b1ce6b"

  url "https://github.com/wonfen/clash-verge-rev/releases/download/v#{version}/Clash.Verge_#{version}_#{arch}.dmg"
  name "Clash Verge Rev"
  desc "Clash Verge 接盘项目"
  homepage "https://github.com/wonfen/clash-verge-rev"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "clash-verge"

  app "Clash Verge.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Clash Verge.app"]
  end

  zap trash: [
    "~/.config/clash-verge",
    "~/Library/Caches/msedge_crashpad_handler",
    "~/Library/Preferences/moe.elaina.clash.verge.plist",
    "~/Library/Saved Application State/moe.elaina.clash.verge.savedState",
  ]
end
