cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.21.4"
  sha256 arm:   "260d800fa2403bfda414d20b910bf0a67373709ae844ae972f1ae3d21a82d846",
         intel: "1470ff90da244c3181bf70d518387cf33192f983c6c6b4c6831f187036a95be3"

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

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
