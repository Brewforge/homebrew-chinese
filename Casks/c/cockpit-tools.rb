cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.17"
  sha256 arm:   "e54622c1808715b7a096b2fd5d870a9c345b4b23a33f718087e1abbd1d1be7fa",
         intel: "3690d688c0442224eb7176daa66f78caaed40a5a42361cf6a5da736e68d4b521"

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
