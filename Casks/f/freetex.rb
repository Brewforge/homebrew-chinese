cask "freetex" do
  version "1.0.0"
  sha256 "a1aa68b913af3057220975bd91d494d4d0c9a621661b160c5ecc8c3b349dcb0c"

  url "https://github.com/zstar1003/FreeTex/releases/download/v#{version}/FreeTex_v#{version}-arm64.dmg",
      verified: "github.com/zstar1003/FreeTex/"
  name "FreeTex"
  desc "一个免费的公式智能识别软件"
  homepage "https://xdxsb.top/FreeTex/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "FreeTex.app"

  zap trash: []
end
