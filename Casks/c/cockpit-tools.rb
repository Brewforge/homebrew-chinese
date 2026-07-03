cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.2"
  sha256 arm:   "b764cab429108d0f9d3f4c8b4e98ce75223bfb0b2da59821a68205c0e4bff746",
         intel: "dadcdf9fc420ac02965057b393f3eb473d9cd8f095d6ab92aff8b58bfaf802bf"

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
