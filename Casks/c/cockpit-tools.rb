cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.2.0"
  sha256 arm:   "fbda70cf12fe9e62bd4f2ca1d9e7144e5ee22fcbcbf593450b4e0b314b6a5faa",
         intel: "ea2be0e15b8628a2323fc0e6cb2c3680a1ebe3c1ee1c4033fe656666588d9bba"

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
