cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.25.7"
  sha256 arm:   "5e34a51d3ec88e62845db415846b87a7d48bf89f6fa06b2f28a516dcf7909f85",
         intel: "ef32721ab61339bcb65984155c56ef41683be579de89a47159c50d5920359dd9"

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
