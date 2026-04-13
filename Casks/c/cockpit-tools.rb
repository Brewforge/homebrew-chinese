cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.21.2"
  sha256 arm:   "6f283f126a93beb778cd3b93368bed5cdf061913f5dba8b1db61d1400d515661",
         intel: "8ee5dcf48afedbaa234f667c2aacace8caae1bd6c1f34205571c4ea08c6d599b"

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
