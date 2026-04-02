cask "downkyi" do
  arch arm: "arm64", intel: "x64"

  version "1.0.24"
  sha256 arm:   "a81b4d497e7f9eda9a2963b5090c12e29dccb7b491faeb2705ef9a665ba19e4d",
         intel: "1e77d8c63c9a6b13ecc49ce9c83d61c2358277a079ce9ab31760bc2e797ca17d"

  url "https://github.com/yaobiao131/downkyicore/releases/download/v#{version}/DownKyi-#{version}-osx-#{arch}.dmg"
  name "DownKyi"
  desc "哔哩哔哩网站视频下载工具"
  homepage "https://github.com/yaobiao131/downkyicore"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "哔哩下载姬.app"

  zap trash: "~/Library/Application Support/DownKyi"
end
