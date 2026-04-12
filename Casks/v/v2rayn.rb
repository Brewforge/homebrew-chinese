cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.20.2"
  sha256 arm:   "f4fe6549aa0ba94dd45e015dac895673fb7af54cd4160918b3b682c397332cc7",
         intel: "911744a7077c265f202daace87a0977697eaabbb9e4778f41c3e515ae816b785"

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
