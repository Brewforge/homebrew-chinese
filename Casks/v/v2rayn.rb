cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.17.3"
  sha256 arm:   "10658331a9cc60c76dcc26f912cef41a8a920793b87e42ed119b9f65efd36057",
         intel: "ee5b4acd358a1739d773e28d9eba759662e2c356cdf6712e7b5e901e02941a33"

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
