cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.10"
  sha256 arm:   "35b21510f4701631f8bf6bb1a568e0c41b73fdbe6376fcff3a6ce33184f0cb35",
         intel: "5424ac4961f56b2a371d89d789321823e95b6e7df0d9c6b5be7d273b0f751664"

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
