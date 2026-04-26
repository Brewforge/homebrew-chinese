cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.11"
  sha256 arm:   "6f09f0e940fc73496c0f12fead3047678e1c0658e17cec2d849b20fdac28adb3",
         intel: "85d800a86775b0ff53b12a21a8bc491e546932c2ff010edc493ea470ad404e35"

  url "https://github.com/jlcodes99/cockpit-tools/releases/download/v#{version}/Cockpit.Tools_#{version}_#{arch}.dmg"
  name "Cockpit Tools"
  desc "通用 AI IDE 账号管理工具"
  homepage "https://github.com/jlcodes99/cockpit-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :monterey"

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
