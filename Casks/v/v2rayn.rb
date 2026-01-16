cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.17.0"
  sha256 arm:   "df23bae86d54f717f91cf44c3f5ff93ec62f17f2af6121a947389fd687fbf5c3",
         intel: "195e560980ce89cc99b728e27956e5c6487a231c90c74767d432e247c95b7d71"

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
