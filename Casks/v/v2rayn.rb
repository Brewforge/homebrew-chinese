cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.21.3"
  sha256 arm:   "2c09925368b3eeb2b702e7238c52bbe4752c68524bb806ff186d8b21d2d35291",
         intel: "cb29de3110fa88e59425913bcb31ff1c0dac81324f04da45adb8ad0c94b21d27"

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
