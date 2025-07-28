cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.0.0-beta.5"
  sha256 arm:   "c5c48527db71784bf6fe873599d9406dd0cfe3ca5b9120ddfd71bff54cdf8096",
         intel: "a2941cc5a8d71727dc1677563788459d007a45c7107c62a628ac9e9cfcb92612"

  url "https://github.com/throneproj/Throne/releases/download/#{version}/Throne-#{version}-macos-#{arch}.zip"
  name "Throne"
  desc "Cross-platform GUI proxy utility"
  homepage "https://github.com/throneproj/Throne"

  livecheck do
    url "https://github.com/throneproj/Throne/tags"
    strategy :page_match do |page|
      match = page.match(/href=.*?(\d+(\.\d+)+)(-beta\.\d)/i)
      next if match.blank?

      match[1].to_s + match[3].to_s
    end
  end

  auto_updates true

  app "Throne/Throne.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/moe.Throne.macosx",
    "~/Library/Preferences/Throne",
  ]
end
