cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.13"
  sha256 arm:   "61b2ca028f5c4da617f988bedc3fc0a2e252fcb8241e96828585a7b1983628fd",
         intel: "93cc0c4211e20107de456d63b6b974ab39e4216119b6ca8484bc29f18c3481bc"

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
