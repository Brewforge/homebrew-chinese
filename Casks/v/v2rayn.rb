cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.22.5"
  sha256 arm:   "586856221244f3c25fe525f836cf33d8e7dc563ce501056b9048ced02e5e8e6a",
         intel: "2698a3356895c6b44425bbc0a632e6d0a4d9fe57bc429e353a79ae2656ad0719"

  url "https://github.com/2dust/v2rayN/releases/download/#{version}/v2rayN-macos-#{arch}.dmg"
  name "v2rayN"
  desc "代理客户端，支持 Xray、sing-box 等"
  homepage "https://github.com/2dust/v2rayN"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "v2rayN.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/v2rayN.app"]
  end

  zap trash: [
    "~/Library/Application Support/v2rayN",
    "~/Library/Preferences/2dust.v2rayN.plist",
  ]
end
