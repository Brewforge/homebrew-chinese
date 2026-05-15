cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.23.4"
  sha256 arm:   "aa64cb086edb8519b0b1aabe16a1ccf38240941115ce66693eb88994d0a5ffe1",
         intel: "3f3c7affe13394a59f7d0ea4ef908d2c1e67e1d48fca823c9e751d7340050af2"

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
