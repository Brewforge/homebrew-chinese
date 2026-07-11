cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.5"
  sha256 arm:   "50ce0bc2ae434dbfe343ee2fef674c342f2407ddf7845f849c2697069a5cfd6e",
         intel: "372d4b80e632ccd2ebabb6551b59e4be760912b0dbb5be22189c96f2bf22f0b3"

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
