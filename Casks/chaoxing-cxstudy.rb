cask "chaoxing-cxstudy" do
  arch arm: "arm64", intel: "x64"

  version "1.2.4"
  sha256 arm:   "0319a3ac650cf7d3e5609b712777f3e7105f8851d2e7f2b43ebd19abb0401b09",
         intel: "49aaf91f1283b4f6334ff61751b1d036115392a6279d0a08652c7578178ca4d8"

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
