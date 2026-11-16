cask "dbeaver-cn" do
  arch arm: "aarch64", intel: "x86_64"

  version "26.2.5"
  sha256 arm:   "2d739a95bbc3bb2f9fada4863a9f11904b94ebb34673999915809f788e849d73",
         intel: "760cbc064685536e0249fb18bb7568be624b6a2737d394c2b3b8a6aacfd9464c"

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
