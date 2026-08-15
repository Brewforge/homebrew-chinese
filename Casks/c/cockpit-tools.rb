cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.20"
  sha256 arm:   "a2d17d643e1bf9293703d93540686d78eeb2aeec843c5da2806491dfa80e9387",
         intel: "9b4195cc2ef35416142458b0caa14fb7fad33a9cc2136cb467289f90d88072fe"

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
