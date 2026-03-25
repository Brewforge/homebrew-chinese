cask "v2rayxs" do
  arch arm: "arm64", intel: "x86_64"

  version "1.6.1"
  sha256 arm:   "efef316c0399961afaffd569dfc77590db3307b25f2551ce0a85bf746b7693c2",
         intel: "110b64729ccdf0ad0e8f7103d5bdb28a703b0fdc6a672d75a9e0bfdf781fa302"

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
