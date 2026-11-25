cask "dbeaver-cn" do
  arch arm: "aarch64", intel: "x86_64"

  version "26.2.5.2"
  sha256 arm:   "84aa5edce7f78aa7c9bac8204956968cbdc6e194208a5654134ccbc6e29af60e",
         intel: "3cb503a14172e29916a6526fc472f75c5ee94603a8688fc9751d20de6416a08f"

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
