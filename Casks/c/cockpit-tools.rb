cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.2"
  sha256 arm:   "73c2b417994cf32bcf3006c6a17775a721f4e6f769549617e3abd4a647ff2a2a",
         intel: "155b559d22ecb3027b664822ee322dc5d826569d17300d489e549c656dd8a0ae"

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
