cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.26.3"
  sha256 arm:   "720047799a126d7d3103be6e22ec9adaecc18f5ef54653a4bfa5a2a339c90fb7",
         intel: "f985676efbe020e7d63308a5d03a8e8d46b2cf547e3dad98e12ea7f239062155"

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
