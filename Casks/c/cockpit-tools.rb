cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.20.19"
  sha256 arm:   "d19ff538885744aef749fabac2d89c2efcbf273b7bcf4bd6cce577271af9db35",
         intel: "de5ccabb9b85ffc1de9f96854203d2328e448cf540e3f9ce600b36f142666152"

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

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
