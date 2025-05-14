cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.12.3"
  sha256 arm:   "056d9292d7da2b1491e854d11460e5a9754a0b228c62002aa98953ec5274c1ce",
         intel: "1a8f2986a319cf50e3308ae9109f57cb5826ffe5ddf3e49a1bf198c0af18da16"

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
