cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.19.5"
  sha256 arm:   "6f6b05b849c520d4621159dcc38905944119d96b179310a94598c85b3a6be1f3",
         intel: "9dabe1d5e871ce64779c3e59a0f64551cd187e9726f6dc5f5a36f57eb535b4f2"

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
