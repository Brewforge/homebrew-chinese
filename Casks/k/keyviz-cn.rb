cask "keyviz-cn" do
  version "2.1.0"
  sha256 "79ad585e5ae6bf2dd873cbeab2ab8610ac77f35db72b6291f50cb51f1a55de41"

  url "https://github.com/zetaloop/keyviz/releases/download/v#{version}/keyviz_#{version}_aarch64.dmg"
  name "keyviz"
  desc "Visualize your keystrokes && mouse actions in real-time"
  homepage "https://github.com/zetaloop/keyviz"

  livecheck do
    url "https://github.com/zetaloop/keyviz/tags"
    strategy :page_match do |page|
      match = page.match(/href=.*?v(\d+(\.\d+){2}(a\d)?)/i)
      next if match.blank?

      match[1].to_s
    end
  end

  auto_updates true

  app "keyviz.app"

  zap trash: [
    "/private/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.example.keyviz",
    "~/Library/Application Scripts/com.example.keyviz",
    "~/Library/Containers/com.example.keyviz",
  ]
end
