cask "aigcpanel" do
  arch arm: "arm64", intel: "x64"

  version "0.8.1"
  sha256 arm:   "37c9e02f1148e38f258a2f68c7f2b4907b856103906ddf39f556fac7be78765f",
         intel: "beabe63af2fb49864e582b28e66622f99fae630324f8e08f28e216b85f2be196"

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
