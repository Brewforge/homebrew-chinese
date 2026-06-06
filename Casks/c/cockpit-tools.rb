cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.25.1"
  sha256 arm:   "3a99706443fc432c04d75e02c9996e73b7252d95ad83ee03c747b51e670b01e5",
         intel: "d114714bd5a1359c0f1e48afb037d15fca4fd5f9c83cbbbbe7eba42b2f79d11d"

  url "https://github.com/jlcodes99/cockpit-tools/releases/download/v#{version}/Cockpit.Tools_#{version}_#{arch}.dmg"
  name "Cockpit Tools"
  desc "通用 AI IDE 账号管理工具"
  homepage "https://github.com/jlcodes99/cockpit-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Cockpit Tools.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Cockpit Tools.app"]
  end

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
