cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.24.8"
  sha256 arm:   "b072b774ce71a1225d4eb8bd2c7df4f364a42701bdf79c5c6b1a715118862c64",
         intel: "816f0c3da58ad38f8633a3bbc8fa3174ddf4474ad68aed35b618c5079673ba89"

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
