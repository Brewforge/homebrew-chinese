cask "aliworkbench" do
  version "9.26.03"
  sha256 :no_check

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

  zap trash: [
    "~/Library/Caches/com.taobao.Aliworkbench",
    "~/Library/Containers/com.taobao.Aliworkbench",
    "~/Library/Preferences/com.taobao.Aliworkbench.plist",
  ]
end
