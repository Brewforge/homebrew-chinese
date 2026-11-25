cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.5.0"
  sha256 arm:   "94a6e89b51eb21cabf98619b114375127262832500e1bcf3a2b78da247743422",
         intel: "2a6a5b26b004db647cb945b617d410b1013fbcf555433d32aee67924e830464d"

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
