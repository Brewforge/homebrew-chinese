cask "cloud-uploader" do
  version "1.3.5"
  sha256 "902189a046c2f1d9aae30bbbba6e505455092dc55390145319fdb06e984289b2"

  mirror = "https://mirror.ghproxy.com/"
  version2 = version.split(".")[0..1].join(".") + ".#{version.split(".")[2].to_i - 1}"
  origin = "https://github.com/lulu-ls/cloud-uploader/releases/download/#{version}/cloud-uploader-#{version2}.dmg"

  name "Cloud Uploader"
  desc "网易云音乐 MAC 云盘上传工具"
  homepage "https://github.com/lulu-ls/cloud-uploader"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "cloud-uploader.app"

  zap trash: []
end
