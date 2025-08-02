cask "throne" do
  arch arm: "arm64", intel: "amd64"

  version "1.0.0-beta.7"
  sha256 arm:   "7bb6fafffd311006fb15c7420446df09cf5442408c4a4ac1cef475a4c80faa7c",
         intel: "6caedf4762932bca08c046e20791830bf135ee6e2280ccbd68c9888d00c0e5f7"

  url "https://github.com/throneproj/Throne/releases/download/#{version}/Throne-#{version}-macos-#{arch}.zip"
  name "Throne"
  desc "Cross-platform GUI proxy utility"
  homepage "https://github.com/throneproj/Throne"

  livecheck do
    # url "https://github.com/throneproj/Throne/tags"
    # strategy :page_match do |page|
    #   match = page.match(/href=.*?(\d+(\.\d+)+)(-beta\.\d)/i)
    #   next if match.blank?

    #   match[1].to_s + match[3].to_s
    # end
    skip "No livecheck as pre-release"
  end

  auto_updates true

  app "Throne/Throne.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/moe.Throne.macosx",
    "~/Library/Preferences/Throne",
  ]
end
