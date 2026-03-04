cask "bilitools" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.7"
  sha256 arm:   "8a778b7b7b09452c56b0833994255903f784b8d2f5b407cf04b14ac9ddaa0288",
         intel: "f5500b45e404b2b8d790135051fe40a90fe78d32095e04508372dfb6f62fdd54"

  url "https://github.com/btjawa/BiliTools/releases/download/v#{version}/BiliTools_#{version}_#{arch}.dmg",
      verified: "github.com/btjawa/BiliTools/"
  name "BiliTools"
  desc "跨平台哔哩哔哩工具箱"
  homepage "https://btjawa.top/bilitools"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "BiliTools.app"

  zap trash: [
    "~/Library/Application Support/com.btjawa.bilitools",
    "~/Library/Caches/com.btjawa.bilitools",
    "~/Library/Logs/com.btjawa.bilitools",
    "~/Library/WebKit/com.btjawa.bilitools",
  ]
end
