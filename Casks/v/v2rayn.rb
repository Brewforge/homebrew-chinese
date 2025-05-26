cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.12.5"
  sha256 arm:   "ad7c8583fe276418490c96ec0acf31100cbc6fd5d14afb9967c2c2670df1ec05",
         intel: "1fbbbb5ed3aaecf8c1d23c32f90febe82331901fcfdc7f4cf83b87ae6696e819"

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
