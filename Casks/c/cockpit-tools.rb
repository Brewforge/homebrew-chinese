cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.24.4"
  sha256 arm:   "13f9437551b7f4f3afcc3c0668fb2040f73490d2aa4c3b4a6257d17ceacc5199",
         intel: "4c7ab551f7511a6ec547c924dd22fde3eccc399926f99d771e13e458246921b4"

  url "https://github.com/jlcodes99/cockpit-tools/releases/download/v#{version}/Cockpit.Tools_#{version}_#{arch}.dmg"
  name "Cockpit Tools"
  desc "通用 AI IDE 账号管理工具"
  homepage "https://github.com/jlcodes99/cockpit-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
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
