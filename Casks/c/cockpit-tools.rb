cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.65"
  sha256 arm:   "88a948cbf8d032afd1b0b0fcec838fa5332b732395503470463e689120964260",
         intel: "943ff4ea6dc2de0188dec547e9c075b0d7e1c8cec3e73b0b196eac2feb925d1f"

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

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/Cockpit Tools.app"]
  end

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
