cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.13"
  sha256 arm:   "7901647f7c7758888f3c22adfe722e82d7b6b33890f4507aaf0b52696a9401dc",
         intel: "7de41d42121a1da9a51f90a176e811c79a0433347f99641b3dce4ce30accc56e"

  url "https://github.com/jlcodes99/cockpit-tools/releases/download/v#{version}/Cockpit.Tools_#{version}_#{arch}.dmg"
  name "Cockpit Tools"
  desc "通用 AI IDE 账号管理工具"
  homepage "https://github.com/jlcodes99/cockpit-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :monterey"

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
