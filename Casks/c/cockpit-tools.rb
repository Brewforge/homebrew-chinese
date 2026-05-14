cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "0.23.3"
  sha256 arm:   "b0254c8a4373d741bb7f356972afec0ccd9aadc5952a3514006b5d7a4555e347",
         intel: "ef684fa3f3798e6ca1989b4ef6c2a44acd8c9144f0a9aeacc8c12c164ed33d8e"

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
