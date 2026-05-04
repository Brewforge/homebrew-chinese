cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.18"
  sha256 arm:   "7c6f1b5cb095211ecf010773ccaeedc976d7fdacfc1234646fd89c6c4b92957f",
         intel: "c7d7462a1918848330ecf27c4a61f2d90020e4562e53ce00ebd56d3870299a65"

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
