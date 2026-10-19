cask "dbeaver-cn" do
  arch arm: "aarch64", intel: "x86_64"

  version "26.2.3"
  sha256 arm:   "1e512db149f3bd6d87fbfc47490741f9104bb391556bd128e9bc1a57d283780e",
         intel: "6e36d64c4b347655110e7e368a2c78a1f663e7bf0373d6cb66198a5de069a508"

  url "https://mirrors.ustc.edu.cn/github-release/dbeaver/dbeaver/LatestRelease/dbeaver-ce-#{version}-macos-#{arch}.dmg"
  name "DBeaver Community Edition"
  desc "Universal database tool and SQL client"
  homepage "https://dbeaver.io/"

  livecheck do
    url "https://mirrors.ustc.edu.cn/github-release/dbeaver/dbeaver/LatestRelease/"
    regex(/dbeaver-ce-(\d+(\.\d+)+)-macos-#{arch}\.dmg/i)
  end

  conflicts_with cask: "dbeaver-community"
  depends_on :macos

  app "DBeaver.app"
  binary "#{appdir}/DBeaver.app/Contents/MacOS/dbeaver"

  uninstall signal: ["TERM", "org.jkiss.dbeaver.core.product"]

  zap trash: [
    "~/Library/Caches/org.jkiss.dbeaver.core.product",
    "~/Library/DBeaverData",
    "~/Library/HTTPStorages/org.jkiss.dbeaver.core.product",
    "~/Library/Preferences/org.jkiss.dbeaver.core.product.plist",
    "~/Library/Saved Application State/org.jkiss.dbeaver.core.product.savedState",
  ]
end
