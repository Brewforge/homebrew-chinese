cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.12.1"
  sha256 arm:   "6b1a634318c89bc0f1c2ca0ea2fe9327b1d568c8e6c7460434c3956b724deeb3",
         intel: "53b8cc18eff8901b96be2cd00f051725c2338385d0ef5a40d5625c4d0c80634d"

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
