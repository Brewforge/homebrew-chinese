cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.25.0"
  sha256 arm:   "6f58442f24147ce3c8d921144864236f4e7307336631790a0f05b85f0ef0ab53",
         intel: "4f828720fc1d7e1e23c355cd194b4e2d0bfb81565105ba8707082387c173ba90"

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
