cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.1"
  sha256 arm:   "e3e6ab24da4ca720c4a0a469df141ecf358da70f0826bb902aa3e9324c412150",
         intel: "dec36e34579368785bbb4044e3daf58f9da87a644f4deab79a2f3d34f30b51f0"

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
