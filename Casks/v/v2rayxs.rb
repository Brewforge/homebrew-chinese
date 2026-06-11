cask "v2rayxs" do
  arch arm: "arm64", intel: "x86_64"

  version "1.6.3"
  sha256 arm:   "600a86c8d3468fb14a070b9c7750a040cefa3095b8356a7cc4f184a4deb754ce",
         intel: "8a735d5b79066e6d2860120cb8fa552f24bb21aedbc5041250231a98e8d73679"

  url "https://github.com/tzmax/V2RayXS/releases/download/v#{version}/V2RayXS_#{arch}.app.zip"
  name "V2RayXS"
  desc "Xray-core 苹果客户端"
  homepage "https://github.com/tzmax/V2RayXS"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

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
