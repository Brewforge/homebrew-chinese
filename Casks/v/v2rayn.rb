cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.24.8"
  sha256 arm:   "c397183b0ac92c0d05a3590ff46c676c6c1448301a641b549d43aebdb307de97",
         intel: "d90c3ee7b8866fa7eaa354428f0951220ac496c2d40868a5532f1a4bcc801763"

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
