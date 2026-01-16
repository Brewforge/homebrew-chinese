cask "clash-mi" do
  version "1.0.15.191"
  sha256 "6931b1c149613c35dbc8ff18eccaba09bfc4e5d49af17e6cb8b0aac562a780a8"

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
