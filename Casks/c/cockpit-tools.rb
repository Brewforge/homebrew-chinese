cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.36"
  sha256 arm:   "8410b023a62923673a2d455bc267eb82ef52e4d6713c7ebf3119f44e07ff5c78",
         intel: "8f717e8f61e005089bb2fe094b68c8354e266b35e366271e121b66de5b26d940"

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
