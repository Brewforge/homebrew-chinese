cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.61"
  sha256 arm:   "5b5c6b89489effcfc1e71c264e83fc75b531f0d06d1b59d959cb634337346b15",
         intel: "ef1c50a92c31825cb21a8b2d9bc8069d9c79e11ec3b5c06ae4c6d93a1a065c99"

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
