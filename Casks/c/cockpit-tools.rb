cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.26.5"
  sha256 arm:   "296415936c28d792f0a795d0c2f29ecc7c9f247df5d74fe7feff3af63fb99274",
         intel: "f10ffdff864e6e88b35c51ca646787aadf3d264fc7001415f7fc2f3c69e2e555"

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
