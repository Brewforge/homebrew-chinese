cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.4"
  sha256 arm:   "2e06254d5d728b5fbe15e1c30a593e90adcf05a24dfc676d52c1d136927d6b33",
         intel: "1e01c29592ec0bf9f32921fb17c5fd896b676a9334d7a85a4dbef4c67bad46a1"

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

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Cockpit Tools.app"]
  end

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
