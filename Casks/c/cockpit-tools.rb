cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.27"
  sha256 arm:   "a7e6939a1a5856c06e85caea76e0f5590aa5294cfba519305c2e104e261ab4f9",
         intel: "deb0c34535ad077e153b5e7cafd2d3b875e5b848e5c8a06d364fe51159062ebd"

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
