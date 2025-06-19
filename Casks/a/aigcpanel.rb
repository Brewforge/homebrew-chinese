cask "aigcpanel" do
  arch arm: "arm64", intel: "x64"

  version "0.11.0"
  sha256 arm:   "83d04412e281bdd6fba240ca3636cbb1747a2841fd550c1e49ec958d989dac2a",
         intel: "fecef07400abcbb0f16e7414fc7f0a28f7ce5a91992bc7fe7e576ef36da28e2e"

  url "https://github.com/modstart-lib/aigcpanel/releases/download/v#{version}/AigcPanel-#{version}-mac-#{arch}.dmg",
      verified: "github.com/modstart-lib/aigcpanel/"
  name "AigcPanel"
  desc "一个简单易用的一站式 AI 数字人系统"
  homepage "https://aigcpanel.com/"

  livecheck do
    url :url
    regex(/AigcPanel-(\d+(\.\d+)+(-beta)?)-mac-#{arch}\.dmg/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        matched = release["assets"].filter_map do |asset|
          match = asset["name"].match(regex)
          next if match.blank?

          match[1]
        end.first

        next if matched.blank?

        matched
      end.first
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
