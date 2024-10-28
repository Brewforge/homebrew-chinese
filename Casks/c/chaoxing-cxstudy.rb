cask "chaoxing-cxstudy" do
  arch arm: "arm64", intel: "x64"

  version "1.2.9"
  sha256 arm:   "9b547e3123de9f13c0a8b4844787ff962987419d08e51611d20eaeeffd2bb3f5",
         intel: "8c59813c4fa9da595c59d156705520d935ad71575f87c3814933af4f87878000"

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
