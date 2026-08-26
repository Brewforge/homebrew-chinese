cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.31"
  sha256 arm:   "74381af2ccb8f1b6af9e8804ea381794ae215c2c20c79301fbbd1d82781c8a10",
         intel: "ca2367ab4b37f03b2c946c8d12eda9ddb79a3d2034932c9d905889ee29744527"

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
