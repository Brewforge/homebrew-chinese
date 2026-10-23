cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.73"
  sha256 arm:   "72d4043add746bf6ba81952024edda87646a9b8427dfe36b7b57143e177e51aa",
         intel: "64b4b1ef8e88cd219ce44b9139d80fb4e315a44494d40c73aa7c3dc8e9436b63"

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
