cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.18.0"
  sha256 arm:   "6d009a15e7c7bca6234f13ad680fbc815072e676eaae0c34b5cbe8fb3b624b23",
         intel: "104792b823faf6f8cb17af67221ef796bf386dc92e676c1545dca4cc52c183d5"

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
    "~/Library/Application Support/v2rayN",
    "~/Library/Preferences/2dust.v2rayN.plist",
  ]
end
