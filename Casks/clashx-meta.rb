cask "clashx-meta" do
  version "1.3.16"
  sha256 "137a7eb8308a314be1a90732182559a1496fb094e2f605d2cd397c3f57105f00"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/MetaCubeX/ClashX.Meta/releases/download/v#{version}/ClashX.Meta.zip"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "ClashX Meta"
  desc "Rule based proxy base on Clash"
  homepage "https://github.com/MetaCubeX/ClashX.Meta"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true

  app "ClashX Meta.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/ClashX Meta.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.metacubex.ClashX.meta",
    "~/Library/Caches/com.metacubex.ClashX.meta",
    "~/Library/HTTPStorages/com.metacubex.ClashX.meta",
    "~/Library/Logs/ClashX meta",
    "~/Library/Preferences/com.metacubex.ClashX.meta.plist",
  ]
end
