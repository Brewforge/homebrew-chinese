cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.13.7"
  sha256 arm:   "078e27cd20fee23bf04ea4cc885bd70f76fb4c990f60ac68b9662e7ed1bd7cb7",
         intel: "f924dbe13fb19c34599031d19739d17c5cdd9aa4a87b40ab1f04862bcd9dedd2"

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
