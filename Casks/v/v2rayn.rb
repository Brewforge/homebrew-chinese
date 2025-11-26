cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.16.4"
  sha256 arm:   "ab5eb04c5f0ab79a4f8e3564d48234c757a0ee31d103b422d55a212d5d921b1c",
         intel: "ad6bcbbc604c1554eac5690d9dc5313e66ed8dfe7b14d0ecc8cf5fe34fb94534"

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
