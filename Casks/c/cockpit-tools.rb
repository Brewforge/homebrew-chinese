cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.39"
  sha256 arm:   "3926a86c23e1e38f5b55f428a9dd0b7a374ec8844ddf4259ab903ccf2096dff2",
         intel: "79b6f4028f24396ea80f2166726b97ce5856b017f3909705c0b480c39959098d"

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
