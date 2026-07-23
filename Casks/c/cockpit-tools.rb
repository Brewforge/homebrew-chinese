cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.14"
  sha256 arm:   "91938eeb841b5d815b9edf7455cf3959bf8b21c1b105603db81137c476a32bab",
         intel: "84c31ebb3d634815100f8c1868455540301dedcb1d115c6d8b762a9a154b3b68"

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
