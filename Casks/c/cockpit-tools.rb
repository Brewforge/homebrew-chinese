cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.75"
  sha256 arm:   "e5d72c71b76c195b24a783724f4610fd6eb10b64b43489ef59dfc053b0b02277",
         intel: "7e51c4340236db0643db123f2c6382a174ddafd9a17070051008494974872f0b"

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
