cask "clashx-meta" do
  version "1.4.36"
  sha256 "d8d76694ef280b6911b9e7e4b65412bc69c0f0483466254521e651c4b72e6cef"

  url "https://github.com/MetaCubeX/ClashX.Meta/releases/download/v#{version}/ClashX.Meta.zip"
  name "ClashX Meta"
  desc "Rule based proxy base on Clash"
  homepage "https://github.com/MetaCubeX/ClashX.Meta"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

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
