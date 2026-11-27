cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.5.3"
  sha256 arm:   "1bff2081a75535c0fbb1d2712fe35c668da0d457f988638a17507c834215aea5",
         intel: "87e0902e7a858f69a2d4e7103681ade6c0ce518d0178908a8f6e78857941e964"

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
