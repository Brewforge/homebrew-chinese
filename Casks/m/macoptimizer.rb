cask "macoptimizer" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "4.0.7"
  sha256 arm:   "fa2e1265513d8f073bdaedd3a1966113510991c9c443e7d730751f6de5707783",
         intel: "9a6910cbebedc3a84ef8f031823dc3710698578b757a100d313d762d29e1e116"

  url "https://github.com/ddlmanus/MacOptimizer/releases/download/v#{version}/MacOptimizer-v#{version}-#{arch}.dmg"
  name "Mac优化大师"
  desc "系统清理和优化工具"
  homepage "https://github.com/ddlmanus/MacOptimizer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "MacOptimizer-v#{version}-#{arch}.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/MacOptimizer-v#{version}-#{arch}.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.tool.AppUninstaller",
    "~/Library/Caches/com.tool.AppUninstaller",
    "~/Library/Preferences/com.tool.AppUninstaller.plist",
    "~/Library/Saved Application State/com.tool.AppUninstaller.savedState",
  ]
end
