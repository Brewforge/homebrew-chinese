cask "macoptimizer" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "5.0"
  sha256 arm:   "68ae036bef1418c37ef0522c7cdc7f1d37978c1f7f9487306c4bddeda4122403",
         intel: "4f84d5b51bcffb6bdd9bb62cbe915f9f141b88aa4785cef0f3e4aa7f659e1321"

  url "https://github.com/ddlmanus/MacOptimizer/releases/download/v#{version}/MacOptimizer-v#{version}-#{arch}.dmg"
  name "Mac优化大师"
  desc "系统清理和优化工具"
  homepage "https://github.com/ddlmanus/MacOptimizer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Mac优化大师.app"

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
