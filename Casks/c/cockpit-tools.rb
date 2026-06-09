cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.25.6"
  sha256 arm:   "663175e6e57c57cf5b26255891e101dcac4d55a124fef11a7b62184df770dbb6",
         intel: "59694ec19ddb04ec4a03fc54d72a10a76a99bd9997913748ebd57b8132b0b10c"

  url "https://github.com/jlcodes99/cockpit-tools/releases/download/v#{version}/Cockpit.Tools_#{version}_#{arch}.dmg"
  name "Cockpit Tools"
  desc "通用 AI IDE 账号管理工具"
  homepage "https://github.com/jlcodes99/cockpit-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
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
