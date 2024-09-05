cask "chaoxing-cxstudy" do
  arch arm: "arm64", intel: "x64"

  version "1.2.3"
  sha256 arm:   "b247f757363a0deb988f91f9fff797424f93d8e9246de3875af318ad1ee3335e",
         intel: "3fdec3146b199999c1c9d9d10eccfa5d82de520449bac0e801165ceeab865a1b"

  url "https://app.chaoxing.com/apis/apk/apk.jspx?apkid=com.chaoxing.cxstudy.#{arch}"
  name "CXStudy"
  name "学习通"
  desc "学习是一种信仰"
  homepage "https://app.chaoxing.com/"

  livecheck do
    url :url
    regex(/study_#{arch}_([^_]+)_[^\.]+\.dmg/i)
    strategy :header_match
  end

  app "学习通.app"

  zap trash: [
    "/Applications/学习通.app",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.chaoxing.cxstudy.sfl*",
    "~/Library/Preferences/com.chaoxing.cxstudy.plist",
    "~/Library/Saved Application State/com.chaoxing.cxstudy.savedState",
  ]
end
