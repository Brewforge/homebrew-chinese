cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.13.8"
  sha256 arm:   "70a3a1e8744ef5f5d8727c859c912ad5bf19467aeaf6431c8ac0e4fd59574a85",
         intel: "b8a867fab5d4e2626b37f17dda362dff939b948c5b9145b0a4f32779efd736cb"

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
