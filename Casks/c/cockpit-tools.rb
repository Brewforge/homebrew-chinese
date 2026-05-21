cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.24.3"
  sha256 arm:   "eaba23d644f195a07db103eac7a97d4d35af484680e1f3a326488e027ad2a58b",
         intel: "8b784cb8ae851bf67e52ae4528492b56f4b9880865ed424713af3a9baa32d9b5"

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
