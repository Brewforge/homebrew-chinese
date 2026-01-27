cask "clash-mi" do
  version "1.0.16.211"
  sha256 "424ed752e7d300d211961afaf8183827a268aa76d9b4e85720d63b25c4c5fb6e"

  url "https://github.com/KaringX/clashmi/releases/download/v#{version}/clashmi_#{version}_macos_universal.dmg",
      verified: "github.com/KaringX/clashmi/"
  name "Clash Mi"
  desc "又一款mihomo核心的代理工具"
  homepage "https://clashmi.app/"

  livecheck do
    # url :url
    # strategy :github_latest
    skip "wrong version"
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Clash Mi.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Clash Mi.app"]
  end

  zap trash: [
    "~/Library/Application Scripts/com.nebula.clashmi",
    "~/Library/Application Scripts/group.com.nebula.clashmi",
    "~/Library/Containers/com.nebula.clashmi",
    "~/Library/Group Containers/group.com.nebula.clashmi",
  ]
end
