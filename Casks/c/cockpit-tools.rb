cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.67"
  sha256 arm:   "6724b9db39bec010dea73ad959c9b492dadae89026759d1ff4d709185a6e74d1",
         intel: "f171b63a84d2f2b7b8cd0adcfa1a42a84a3c7dc3ba3ea2a568754536ae3a3da3"

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

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/Cockpit Tools.app"]
  end

  zap trash: [
    "~/Library/Application Support/cockpit-tools",
    "~/Library/WebKit/com.jlcodes.cockpit-tools",
  ]
end
