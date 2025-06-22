cask "aigcpanel-pro" do
  arch arm: "arm64", intel: "x64"

  version "0.12.0"
  sha256 arm:   "cf288a6f019d4eeba0110d7bbb3ad8c852c630eb818117ac8ba716d5aece0aa7",
         intel: "73324d009b8a79417d2146355b38c9e9ce17419c565a35924949169e98a3a453"

  url "https://github.com/modstart-lib/aigcpanel/releases/download/v#{version}/AigcPanelPro-#{version}-mac-#{arch}.dmg",
      verified: "github.com/modstart-lib/aigcpanel/"
  name "AigcPanel"
  desc "一个简单易用的一站式 AI 数字人系统"
  homepage "https://aigcpanel.com/"

  livecheck do
    url :url
    regex(/AigcPanelPro-(\d+(\.\d+)+(-beta)?)-mac-#{arch}\.dmg/i)
    strategy :github_latest do |json, regex|
      json["assets"]&.map do |asset|
        match = asset["browser_download_url"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
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
