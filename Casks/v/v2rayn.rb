cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.23.4"
  sha256 arm:   "6cfbd8dbfd7be87b4f56245fef1483fc6fd6cb43a1a693505c8ac6087d838533",
         intel: "5cc04792bbe8a43b28af11f900765b0a37b11c9b93116a02f06dde5abae12ed9"

  url "https://github.com/2dust/v2rayN/releases/download/#{version}/v2rayN-macos-#{arch}.dmg"
  name "v2rayN"
  desc "代理客户端，支持 Xray、sing-box 等"
  homepage "https://github.com/2dust/v2rayN"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

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
