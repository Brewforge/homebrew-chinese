cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.14.9"
  sha256 arm:   "50ddbc4b9a2a8e4db1f96579a50a826e12952111c27a740ae0beac2468b7a05e",
         intel: "9cd525b1f7c709b7f03d21107c0b4694ab97054eea6fc393cb985515bc8f6ae7"

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
