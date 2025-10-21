cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.14.12"
  sha256 arm:   "31e0e7a4da46fff2799770a8466a34b536c1c0de8a7a7c2bc1d6a77d731f0405",
         intel: "8a375a46b53a2106006d5b22578d083b44b851f80fb9a1213127bb31127aba75"

  url "https://github.com/2dust/v2rayN/releases/download/#{version}/v2rayN-macos-#{arch}.dmg"
  name "v2rayN"
  desc "代理客户端，支持 Xray、sing-box 等"
  homepage "https://github.com/2dust/v2rayN"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

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
