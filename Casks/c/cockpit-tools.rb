cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.34"
  sha256 arm:   "de75a90e59b93a9326a9d7ccf046528a8fc41ff99b318e179c98059ada33cb79",
         intel: "1dbe60192cf5eadc7554df0959a6d14f2672768de0500c2bbd8affae5aced0c7"

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
