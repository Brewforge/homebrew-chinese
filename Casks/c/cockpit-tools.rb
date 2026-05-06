cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.20"
  sha256 arm:   "00fc9d94881514804d8a706d168cf26efd5b0b90fd973f269fd2df94b8fe2e5c",
         intel: "95ea84a8f3ba6d439005f98828a4fa2940f25a0853c1e0652e0ce12309a33efe"

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
