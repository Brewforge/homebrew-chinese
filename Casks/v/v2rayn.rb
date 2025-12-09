cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.16.6"
  sha256 arm:   "899bef66256430db86968a0292fc6e4e28eab96cc9e84014e2c6e02e4abdd21e",
         intel: "a088a64b19603860ac62d9be55d16cb1cc39a68997f64896d695847f6f56f644"

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
