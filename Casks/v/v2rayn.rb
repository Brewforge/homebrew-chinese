cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.22.2"
  sha256 arm:   "a5baa825c559f9b7f3cef58ad390ba489de9362d6e5c74b27a52c5001495c1f4",
         intel: "3c306b4fd1523827794a5daeccdfb76dda679139cb5191ff7d1469812988d726"

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
