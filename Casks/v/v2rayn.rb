cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.17.1"
  sha256 arm:   "a779ae932cb39538cf637d179daa9336635b39f0cb63b923344825f0103158c6",
         intel: "9488da84321afaac6ee205a3877f95f1583e7b6f43fa6c5619e49a74d434e095"

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
