cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "e87626eee6cef6474f2b975736208e783bbe1a0e12cff51a5600df653e20ac3a",
         intel: "ff1737c0873457f120c44242f2fb0da56d07e37bfd3664223100534a1a13c9ef"

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
