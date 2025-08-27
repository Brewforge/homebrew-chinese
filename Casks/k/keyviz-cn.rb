cask "keyviz-cn" do
  version "2.0.0a2"
  sha256 "144beb2fa2c4b234b416fdb8c0e0df7ca203efdbba606b0491712ab15b621079"

  url "https://github.com/zetaloop/keyviz/releases/download/v#{version}/keyviz-v#{version}-macos.dmg"
  name "keyviz"
  desc "Visualize your keystrokes && mouse actions in real-time"
  homepage "https://github.com/zetaloop/keyviz"

  livecheck do
    # url "https://github.com/zetaloop/keyviz/tags"
    # strategy :page_match do |page|
    #   match = page.match(/href=.*?v(\d+(\.\d+)+(a\d)?)/i)
    #   next if match.blank?

    #   match[1].to_s
    # end
    skip "No livecheck as pre-release"
  end

  auto_updates true

  app "keyviz.app"

  zap trash: [
    "/private/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.example.keyviz",
    "~/Library/Application Scripts/com.example.keyviz",
    "~/Library/Containers/com.example.keyviz",
  ]
end
