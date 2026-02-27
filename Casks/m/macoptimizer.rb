cask "macoptimizer" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "4.0.6"
  sha256 arm:   "e915ef32f8f87114038c8ea6757906fd80ed3afc338fd5dacab97f45c53f6eb8",
         intel: "fd153c4e20021118704be38a4109940ad8c49b72d8a436d99adfb662fc6bb991"

  url "https://github.com/ddlmanus/MacOptimizer/releases/download/v#{version}/Mac._v#{version}_#{arch}.dmg"
  name "Mac优化大师"
  desc "系统清理和优化工具"
  homepage "https://github.com/ddlmanus/MacOptimizer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Mac优化大师.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Mac优化大师.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.tool.AppUninstaller",
    "~/Library/Caches/com.tool.AppUninstaller",
    "~/Library/Preferences/com.tool.AppUninstaller.plist",
    "~/Library/Saved Application State/com.tool.AppUninstaller.savedState",
  ]
end
