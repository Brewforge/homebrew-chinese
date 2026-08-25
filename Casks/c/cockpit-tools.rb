cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.29"
  sha256 arm:   "82654bceaffaf4229f0dba39ac5f4972d26b6d83ce8c87e9a0bf4760b80fea1d",
         intel: "6a415d06714fdd59bdabb9062d1b9a3ac4708c0fb9453f6e4e1e19732a7fd3a8"

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
