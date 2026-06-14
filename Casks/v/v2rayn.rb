cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.22.7"
  sha256 arm:   "90400f4aeb657e59da0f1743c658fbfe604ed005e0fa71f7698d43aa954f199c",
         intel: "f120dc6cabc01678602177dee79fddf3908e21213942711b0098cb05133e669b"

  url "https://github.com/2dust/v2rayN/releases/download/#{version}/v2rayN-macos-#{arch}.dmg"
  name "v2rayN"
  desc "代理客户端，支持 Xray、sing-box 等"
  homepage "https://github.com/2dust/v2rayN"

  livecheck do
    url :url
    strategy :github_latest
  end

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
