cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.24.4"
  sha256 arm:   "0d7111daf19bc014e5e4e05fdf08b3c5718760e4624103bf724d4cf45d4b7888",
         intel: "3107cc853056b7949d1f5cb20c043c81ab76b73b112e48cbd0ac65c811a5caf3"

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
