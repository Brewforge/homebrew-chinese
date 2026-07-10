cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.4"
  sha256 arm:   "4d39c6032862ba2bf23501da370e61ae63532e329c249d8f9dd4a40d212df25f",
         intel: "f94ff5959c8d2d80e0004a8c50b64137ef2fd1c81a02c4aef2e2d4e6b76b59e5"

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
