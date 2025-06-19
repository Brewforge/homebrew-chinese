cask "aigcpanel-pro" do
  arch arm: "arm64", intel: "x64"

  version "0.12.0-beta"
  sha256 arm:   "37dd290401b2bf2c4482c2c5d1f752eef5bcc0f7623004cf4e0f2e3c7c67f494",
         intel: "042d187fe5d6d394fe8d55ad0ac7657edd9cbacec4cf1bdd3001869752312a66"

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
