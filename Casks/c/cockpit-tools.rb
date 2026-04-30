cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.16"
  sha256 arm:   "2566376776f1f59e5c5b009dd39dbf04f95fb10285351d39aa7bcbcfd13721e2",
         intel: "6d57dae82df4aab4e0a567f4504b592e026af9bffbf338659776bb58a032c9a2"

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
