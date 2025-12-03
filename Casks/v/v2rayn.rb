cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.16.5"
  sha256 arm:   "e279e0dcdb6a18744d24d66f836ae84303a5ce7292afc4a32fb8b81669150701",
         intel: "fd6282eaafbb5261ecb2744491ab732a4630b028fb26675538e9fb805320a0ad"

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
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/2dust.v2rayN",
    "~/Library/Application Support/v2rayN",
    "~/Library/Preferences/2dust.v2rayN.plist",
  ]
end
