cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.16"
  sha256 arm:   "a8e127c22cb07fd74c7ccff64fc6f1f600fa7e44f4cf968a8d4b81b2ec84b9b1",
         intel: "d97d0b9db28865b7e42e62c71ec3a6441cee9177e017446ec2e7a6478cef0e4e"

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
