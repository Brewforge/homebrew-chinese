cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.16.9"
  sha256 arm:   "4f908be42b264b07ce017993148fb5d795389b48d398f6beb7ea95fa3ae4918e",
         intel: "ca1f1bb1e6e06054d0a94d1151d09b9d4c44bd4035feaaeec4517691bfc52dcc"

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
