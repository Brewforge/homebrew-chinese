cask "aigcpanel" do
  arch arm: "arm64", intel: "x64"

  version "0.6.0"
  sha256 arm:   "31fb5b7cbd571669fed0477fec6c1b5540a035d55bbb39aa484418aff6cfe65c",
         intel: "90bd34ffa6038f0dfb4e99d4d14ef74dad17a3a1d06285f6a8a4868b5921a6cd"

  url "https://github.com/modstart-lib/aigcpanel/releases/download/v#{version}/AigcPanel-#{version}-mac-#{arch}.dmg",
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
