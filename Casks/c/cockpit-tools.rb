cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.10"
  sha256 arm:   "3fd4a2e778ac496c1a06d865bb3df4fd4075a4997582dca12d0969a5486931e4",
         intel: "34b2733393c4b4191d51a5dc4d5da67a011db1a5abb78d19fc421682115c57df"

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
