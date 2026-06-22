cask "dbeaver-cn" do
  arch arm: "aarch64", intel: "x86_64"

  version "26.1.1"
  sha256 arm:   "3f0b85c0413e681106ff293036b101976d327eb69d7bc05d5141dd2c91819307",
         intel: "1264c7bb311ce1b78ce76842d93ee9a19d5238a6bd90ed91a7736772d96c058a"

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
