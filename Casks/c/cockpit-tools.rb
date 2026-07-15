cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.4"
  sha256 arm:   "10780050d9b6620c3462c85fce36ea31f6e1840af0d258fb23315009d8fd916a",
         intel: "2f7a94f9d2430da43ff1f260890b84863e304b0f0b2b31c44cd925950721091b"

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
