cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.15"
  sha256 arm:   "b50b9040de173870fc18c266a2b7413660cbab0673197d2bdb8c58b55d81f0a2",
         intel: "1f8fdd9b9313df289f9c086eef4d04bc885944a692446aefced36a84e50deb3c"

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
