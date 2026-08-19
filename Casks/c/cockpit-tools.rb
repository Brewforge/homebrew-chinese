cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.23"
  sha256 arm:   "6aed18f2f176e2385fd19a53dd9672714b6e8c4e5e58428efd65c4574349b11b",
         intel: "fd9e3b24de2b43787da2df521ca8dee767a45cabf087b304b04941c053a9bb2c"

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
