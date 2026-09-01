cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.24.9"
  sha256 arm:   "60b7812c460f985300dadda69f2ba2ecd74c919f8c96d1e97ab07941e6e4d965",
         intel: "71d0dc8fb1d04990ba6fe25a8faaf4023ea3999f99a9c818ff10d9db5dee3cc1"

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
