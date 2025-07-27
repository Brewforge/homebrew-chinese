cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.13.2"
  sha256 arm:   "b16296864a142749cc7895db4f0ea4084cc64d80f9cacec9002033b728504eee",
         intel: "db1654c9f4fa8b471490023a6e67d9485e16a06c5e80d6fab71fb05054d4677b"

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
