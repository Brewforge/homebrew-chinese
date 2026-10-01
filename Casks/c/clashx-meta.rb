cask "clashx-meta" do
  version "1.4.46"
  sha256 "b98426e9ab51b7f01afb2f5491571034d17de3aecab36d4e346771ff9d5ce96d"

  url "https://github.com/MetaCubeX/ClashX.Meta/releases/download/v#{version}/ClashX.Meta.zip"
  name "ClashX Meta"
  desc "Rule based proxy base on Clash"
  homepage "https://github.com/MetaCubeX/ClashX.Meta"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "ClashX Meta.app"

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/ClashX Meta.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.metacubex.ClashX.meta",
    "~/Library/Caches/com.metacubex.ClashX.meta",
    "~/Library/HTTPStorages/com.metacubex.ClashX.meta",
    "~/Library/Logs/ClashX meta",
    "~/Library/Preferences/com.metacubex.ClashX.meta.plist",
  ]
end
