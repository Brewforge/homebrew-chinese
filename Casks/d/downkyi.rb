cask "downkyi" do
  arch arm: "arm64", intel: "x64"

  version "1.0.23"
  sha256 arm:   "c43355d8af97aea80afd046ced03075157d69472adf41d3e56301007937adec2",
         intel: "a84a3efbeb3183397b6b6d820b8f0261957f4c40397f577592c1f89851dd1b47"

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
