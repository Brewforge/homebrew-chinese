cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.84"
  sha256 arm:   "5265cc667f790d12389932b709249ed7e4385723eebd5020708f92aaadb5693c",
         intel: "d5a6d78a636343f30c8cb022056bb14502987f9ea812809261f6a7aec96b4bdb"

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
