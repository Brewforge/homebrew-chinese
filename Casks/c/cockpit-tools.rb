cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.4"
  sha256 arm:   "1ef8f171558121a627ba5e6bcf30e7bfc81c0b6c8c86b47088391701c5e1791e",
         intel: "b3a9f211f2bc5cbda69b55f440b28b8479b81069bb9d39e7b8fe5d8953c02150"

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
