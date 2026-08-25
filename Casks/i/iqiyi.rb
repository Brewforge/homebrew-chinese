cask "iqiyi" do
  version "17.6.1,20260616180100"
  sha256 :no_check

  url "https://static-d.iqiyi.com/ext/common/iQIYIMedia_271.dmg",
      verified: "static-d.iqiyi.com/ext/common/"
  name "爱奇艺视频"
  desc "爱奇艺视频官方客户端"
  homepage "https://app.iqiyi.com/mac/player/index.html"

  livecheck do
    url :url
    strategy :extract_plist
  end

  depends_on macos: :big_sur

  app "爱奇艺.app"

  zap trash: [
    "~/Library/Application Scripts/com.iqiyi.player",
    "~/Library/Application Scripts/group.com.qiyi",
    "~/Library/Containers/com.iqiyi.player",
    "~/Library/Group Containers/group.com.qiyi",
  ]
end
