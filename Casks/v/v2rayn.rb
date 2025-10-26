cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.15.6"
  sha256 arm:   "250e48f041bf1978afa7027fa84924adf013900f0c24a9d8fcf4201168e2de8d",
         intel: "220eca83002dee8e5892d5c2465db3fbedc269b3f77001f00cf8a8d5e6d6274e"

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
