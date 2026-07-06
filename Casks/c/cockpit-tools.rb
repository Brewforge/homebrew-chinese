cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.5"
  sha256 arm:   "bd0653d5ca4434b79d5c3ab7bca541a67a9bba72d70f99ff439a038b6ad35505",
         intel: "05b463feb1724701f60fad50bee3649f0aad40eeff2e78aded69047147d78529"

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
