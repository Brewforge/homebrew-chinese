cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.25.6"
  sha256 arm:   "81c979a7fa480a24a7e9f9629992c2641f78d7b75a8ca8ce588ba36bfcbbbf91",
         intel: "92b15c6bf634b7fe94d4a82b25ff1a1738cf80f6c6886f66d2dff52efd84f13f"

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
