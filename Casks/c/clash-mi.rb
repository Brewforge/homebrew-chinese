cask "clash-mi" do
  version "1.0.18.403"
  sha256 "1d6cebece21bcf05d6679d3c27e6af2488afde7522d6dc057b2f6eb1fa16ed77"

  url "https://github.com/KaringX/clashmi/releases/download/v#{version}/clashmi_#{version}_macos_universal.dmg",
      verified: "github.com/KaringX/clashmi/"
  name "Clash Mi"
  desc "又一款mihomo核心的代理工具"
  homepage "https://clashmi.app/"

  livecheck do
    url :url
    strategy :github_latest
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
