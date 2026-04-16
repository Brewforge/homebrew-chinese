cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.20.3"
  sha256 arm:   "f260c26891f070bab7bfbfb1d06502a1b48a058279bab50f6cd7efedd87d993c",
         intel: "51a5b0d0f94db6d6ac43e15a611e8a9063996a4ddb9c62c741aeae7aabe7968c"

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
