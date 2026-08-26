cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.32"
  sha256 arm:   "6b3b908f52846e82ba1430326c041bf386722e16732fdcad73b2e1fb35e36c8c",
         intel: "76363bf3d0d5fa67edb3c3d4e5a251f8339d957b3d021c6f3ee14a44e66077da"

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
