cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.12.4"
  sha256 arm:   "9a0f1a04897b30190ef39ef03e683a63efaa8dd4bc46a6a9a8abd5c6fc3d4601",
         intel: "55c89d2c6e34912df4a5fa87430c54dfe8104b64ea41a8a7f0d9e0d147c15435"

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
