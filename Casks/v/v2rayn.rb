cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.13.6"
  sha256 arm:   "d4e638b63e562cf32c9ef910ad19e21adc1f16458493144597284b19990422bd",
         intel: "714e9f7c4cfda86171bb81d77c51e0f0205a766d22c2717acfd4ed45f945cddf"

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
