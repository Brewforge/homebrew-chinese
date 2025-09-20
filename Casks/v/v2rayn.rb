cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.14.10"
  sha256 arm:   "91f4e133b6c38f3ff8aee1831b8f09163754ef6290a0e11785d7df24b21ccd0d",
         intel: "e3d589918951f0762f906045550647055b01f7ea413b49a9733c5aa8946badcf"

  url "https://github.com/2dust/v2rayN/releases/download/#{version}/v2rayN-macos-#{arch}.dmg"
  name "v2rayN"
  desc "代理客户端，支持 Xray、sing-box 等"
  homepage "https://github.com/2dust/v2rayN"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "v2rayN.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/v2rayN.app"]
  end

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/2dust.v2rayN",
    "~/Library/Application Support/v2rayN",
    "~/Library/Preferences/2dust.v2rayN.plist",
  ]
end
