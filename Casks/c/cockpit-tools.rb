cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.59"
  sha256 arm:   "cfbccc1f82b48bc70f3ceeb0eeb34e9c737310b52b13a6008a892fe4a88b0f4b",
         intel: "ed22c7d8adb024e72d9431311610d8d8cc82f159d9d19fe9f35ef4f924b9abfd"

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
