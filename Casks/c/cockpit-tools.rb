cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.70"
  sha256 arm:   "e9bfec508055baa52d6ea1d2d4203b66e01aba1bca70c88687244cf4e016c926",
         intel: "228821f2affc1c256171f14d9d69ea94eb26718968519692287e48b957853806"

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
