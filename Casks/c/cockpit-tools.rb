cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.24.12"
  sha256 arm:   "fbe92f81bbd3628a473a16604357a936b52cb016e51c5f6fb44d3395809379b0",
         intel: "492a6bf19289aa0dd01440eb1f016484f08b21dfcb1de4cd1b23a3e710144150"

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
