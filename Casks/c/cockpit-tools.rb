cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.21"
  sha256 arm:   "4df992ea7f5accd8532412f4cae700b339f959e6ec85736dd686fe6c77c39286",
         intel: "5584c80876d322e695f6ab5123d8a41aaae265cb3f11fd1d1d0b321433cd1f2d"

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
