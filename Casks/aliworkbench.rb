cask "aliworkbench" do
  version "9.27.03"
  sha256 "61caabd57a079e04fd30d4b40702f48704a503c397759cffc22a5cb7d96b4e34"

  url "https://download.alicdn.com/wangwang/AliworkbenchQN_(#{version}QNM).dmg"
  name "aliworkbench"
  desc "淘宝天猫商家后台"
  homepage "https://work.taobao.com"

  livecheck do
    url "https://work.taobao.com/download.html"
    regex(/(\d+(\.\d+)+)QNM/i)
  end

  auto_updates true

  app "千牛.app"

  zap trash: []
end
