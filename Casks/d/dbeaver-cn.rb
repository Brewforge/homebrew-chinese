cask "dbeaver-cn" do
  arch arm: "aarch64", intel: "x86_64"

  version "26.1.5"
  sha256 arm:   "092616dac1931b7af23c93d53ba8b785ed98fdac4813edacd9ff5bb6e2fa25a0",
         intel: "a67b8694e44d66dc05d94a650ffb57c2b17da0daccc49d4c664965342e24d676"

  url "https://mirrors.ustc.edu.cn/github-release/dbeaver/dbeaver/LatestRelease/dbeaver-ce-#{version}-macos-#{arch}.dmg",
      verified: "mirrors.ustc.edu.cn/github-release/dbeaver/dbeaver/"
  name "DBeaver Community Edition"
  desc "Universal database tool and SQL client"
  homepage "https://dbeaver.io/"

  livecheck do
    url "https://mirrors.ustc.edu.cn/github-release/dbeaver/dbeaver/LatestRelease/"
    regex(/dbeaver-ce-(\d+(\.\d+)+)-macos-#{arch}\.dmg/i)
  end

  conflicts_with cask: "dbeaver-community"
  depends_on macos: :big_sur

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
