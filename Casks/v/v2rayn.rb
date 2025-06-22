cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.12.7"
  sha256 arm:   "dee33c76ce98fee472246bf14cc034c69643244acf0ea5bd1b0d746cab51340c",
         intel: "41e9ef4c6986ba1fdabef99c2baea6fdeb9863a723290eece9d3da3dfd07c5a6"

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
