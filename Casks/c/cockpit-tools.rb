cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.23.8"
  sha256 arm:   "fcf9039e5f996aff631d61fddb3cd718ca1c0f4aff03d7a577b8a6a31242879c",
         intel: "62cc01a7bb6df453136ce657414fb6510cb0b74ad6dde7043743670b38ac331d"

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
