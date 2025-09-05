cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.14.6"
  sha256 arm:   "aca613428107a862620aae1bcb56c05a88c4bd20d8d9c732b2be959b327df65d",
         intel: "6569a1d4030066bf02b7e0698a9a2b98404a8d9a69fa7225098e4039a677f0c5"

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
