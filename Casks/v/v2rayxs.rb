cask "v2rayxs" do
  arch arm: "arm64", intel: "x86_64"

  version "1.6.2"
  sha256 arm:   "c55543d449d845da19ed1568127be3745f88498ecff2f54121d0b6a347a088fe",
         intel: "5641c4447664935b55dd41aa3a1e14c823d376fb4c0f043a22bcb9f83a7c5b05"

  url "https://github.com/tzmax/V2RayXS/releases/download/v#{version}/V2RayXS_#{arch}.app.zip"
  name "V2RayXS"
  desc "Xray-core 苹果客户端"
  homepage "https://github.com/tzmax/V2RayXS"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "V2RayXS.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/V2RayXS.app"]
  end

  zap trash: [
    "/Library/Application Support/V2RayXS",
    "~/Library/Application Support/V2RayXS",
    "~/Library/Caches/cenmrev.V2RayXS",
    "~/Library/HTTPStorages/cenmrev.V2RayXS",
    "~/Library/Preferences/cenmrev.V2RayXS.plist",
  ]
end
