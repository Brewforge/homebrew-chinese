cask "clash-mi" do
  version "1.0.17.300"
  sha256 "be8ad5d07f1ced20b8da06edb365dc7b8090eb2c2affc3bfd38d0ef993ed4af7"

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
