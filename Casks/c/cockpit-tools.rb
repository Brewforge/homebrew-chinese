cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.5.2"
  sha256 arm:   "fb372b0abe1c1e94e784dc222c36737b95ef7edd4bd50c1cea3854212c7f6ec6",
         intel: "f8c6a632ee573da9f15679364b76c3ba23bd01ab095438356f79e461b2ea6baf"

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
