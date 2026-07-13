cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.0"
  sha256 arm:   "f0eea74c5aa0e63af62d60fc2affe181a40487c6f6ac02a786f15a1abe9256a4",
         intel: "60be2e134a88edb4d44fc04f76ed33af8610ffc7b5fdcea020e947b5a4e2d18a"

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
