cask "clashx-meta" do
  version "1.4.9"
  sha256 "60183390af3f323a3c5976524a4d2cd7b5b2e02ed92fe75de7cb3098a2960dd4"

  url "https://github.com/MetaCubeX/ClashX.Meta/releases/download/v#{version}/ClashX.Meta.zip"
  name "ClashX Meta"
  desc "Rule based proxy base on Clash"
  homepage "https://github.com/MetaCubeX/ClashX.Meta"

  livecheck do
    url :url
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
