cask "cockpit-tools" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.62"
  sha256 arm:   "374a7ae1c97b7bc80fef838af5be75ed157e3a7bf942200f025bfec6641fee10",
         intel: "b4b56e285bb6ff29b3ad1f44cdf5f7e879d0ecfefbf5dac5700d644449f584ca"

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
