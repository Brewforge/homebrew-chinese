cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.22.6"
  sha256 arm:   "6814badbb4300ddef513e31a157b17cd385c3af8d8a5163d7ff0db298d2efd72",
         intel: "3460493192c2cd8d025690dbe571d58131f59d771bc12e106236126ba8bf773d"

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
