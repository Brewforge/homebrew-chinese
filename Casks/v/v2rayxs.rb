cask "v2rayxs" do
  arch arm: "arm64", intel: "x86_64"

  version "1.6.4"
  sha256 arm:   "35249e3bc539832dea3a46542f0482c50af649730dad18cfdd3b9d2f83fce9ed",
         intel: "0849a763c2d8c53cba07e7d195c253051635c4c9b17ef05c43e349a0cf7422ff"

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

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/V2RayXS.app"]
  end

  zap trash: [
    "/Library/Application Support/V2RayXS",
    "~/Library/Application Support/V2RayXS",
    "~/Library/Caches/cenmrev.V2RayXS",
    "~/Library/HTTPStorages/cenmrev.V2RayXS",
    "~/Library/Preferences/cenmrev.V2RayXS.plist",
  ]
end
