cask "aigcpanel" do
  arch arm: "arm64", intel: "x64"

  version "0.9.0"
  sha256 arm:   "6faf42ec687eb545d4e25161178b2e954479444aa1bf312f62417ca541d0b63e",
         intel: "0c656ee68ba0281603655977395dc339008add613af537ebc12adaed3971d406"

  url "https://github.com/modstart-lib/aigcpanel/releases/download/v#{version}/AigcPanelPro-#{version}-mac-#{arch}.dmg",
      verified: "github.com/modstart-lib/aigcpanel/"
  name "AigcPanel"
  desc "一个简单易用的一站式 AI 数字人系统"
  homepage "https://aigcpanel.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "AigcPanel.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/AigcPanel",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/AigcPanel.helper.GPU",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.AigcPanel.1Gn1Er",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.AigcPanel.1jLUgj",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/T/.AigcPanel.cGQgLw",
    "~/Library/Application Support/aigcpanel",
    "~/Library/Preferences/AigcPanel.plist",
    "~/Library/Saved Application State/AigcPanel.savedState",
  ]
end
