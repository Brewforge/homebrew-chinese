cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.20.4"
  sha256 arm:   "641fda3dba8f4be0176d7a516a9431c975e998a6fb431475999b974f3dd65e95",
         intel: "17f577608626925594820dde375d33a58f36a45b2786b2011e9c83abf3f2c80a"

  url "https://github.com/2dust/v2rayN/releases/download/#{version}/v2rayN-macos-#{arch}.dmg"
  name "v2rayN"
  desc "代理客户端，支持 Xray、sing-box 等"
  homepage "https://github.com/2dust/v2rayN"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "v2rayN.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/v2rayN.app"]
  end

  zap trash: [
    "~/Library/Application Support/v2rayN",
    "~/Library/Preferences/2dust.v2rayN.plist",
  ]
end
