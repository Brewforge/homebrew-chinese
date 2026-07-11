cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.23.3"
  sha256 arm:   "3a530127bc4964317875e705b9b81043b3ca7e0867743012ee9cac42eae99c34",
         intel: "b8b84e592f5bd55e6a266d67787c36c7857984729c57af542b13187e7e83fd15"

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
