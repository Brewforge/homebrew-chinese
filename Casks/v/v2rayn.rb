cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.22.3"
  sha256 arm:   "eaa7f196bab7a4ab3a4b3f9660419d93405ecea882eb705d21e12dbf84f25c03",
         intel: "475bf19246c05895d37e37481b3329b85b5d11c38c13dbf91e8a960285ca9dc6"

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
