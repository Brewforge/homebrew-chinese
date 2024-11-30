cask "chaoxing-cxstudy" do
  arch arm: "arm64", intel: "x64"

  version "1.3.0"
  sha256 arm:   "f5fdd7fdcbce933673fa9ccfc8d006453533487900253f3cf7944447c91f73ef",
         intel: "b28ad8771624b29f8be11d4f54226f33195565df2dd51a2fb35c196feee7031d"

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
