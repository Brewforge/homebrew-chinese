cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.25.4"
  sha256 arm:   "53d2e771c76ac41d0955a9280b0dd6ad9c426cb904398edbcba84123d20f10a5",
         intel: "887e7e8c60e0a56afafb1ff60a8cd167b5aefbf726f9be523ab563a6f4c9c626"

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

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/v2rayN.app"]
  end

  zap trash: [
    "~/Library/Application Support/v2rayN",
    "~/Library/Preferences/2dust.v2rayN.plist",
  ]
end
