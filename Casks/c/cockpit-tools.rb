cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.66"
  sha256 arm:   "918178bc95bdf397813014fbf85ad5dec0958a41c03ee103aff02bf369300b4a",
         intel: "148f6b32790202302976003aa74a7c6e42c9d61afd9f4c1b21440704d81d6d34"

  url "https://github.com/jlcodes99/cockpit-tools/releases/download/v#{version}/Cockpit.Tools_#{version}_#{arch}.dmg"
  name "Cockpit Tools"
  desc "通用 AI IDE 账号管理工具"
  homepage "https://github.com/jlcodes99/cockpit-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Cockpit Tools.app"

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/Cockpit Tools.app"]
  end

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
