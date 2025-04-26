cask "v2rayxs" do
  arch arm: "arm64", intel: "64"

  version "1.5.10"
  sha256 arm:   "0de8519d035db77c2ad314772db15b655e1ac7bec24e35768be745f3708a26b3",
         intel: "d431fd051c3dc7af02bd313c6d05d90cf604b70ed3ec5bba6fd4c49ef3e638d9"

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
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/cenmrev.V2RayXS",
    "~/Library/Application Support/V2RayXS",
    "~/Library/Caches/cenmrev.V2RayXS",
    "~/Library/HTTPStorages/cenmrev.V2RayXS",
    "~/Library/Preferences/cenmrev.V2RayXS.plist",
  ]
end
