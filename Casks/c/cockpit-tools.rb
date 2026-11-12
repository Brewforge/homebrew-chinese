cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.82"
  sha256 arm:   "bae920f856654b9658eb4e7e3691655d58a57a6bf996c765959a5ff61c72652e",
         intel: "0d7aa9dd199b277ec7c6fde1b8661577bb70bff7c40a49311cb20fe68328ec58"

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
