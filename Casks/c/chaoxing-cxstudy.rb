cask "chaoxing-cxstudy" do
  arch arm: "arm64", intel: "x64"

  version "1.3.9"
  sha256 :no_check

  url "https://app.chaoxing.com/apis/apk/apk.jspx?apkid=com.chaoxing.cxstudy.#{arch}"
  name "CXStudy"
  name "学习通"
  desc "学习是一种信仰"
  homepage "https://app.chaoxing.com/"

  livecheck do
    url :url
    strategy :header_match
    regex(/study_#{arch}_([^_]+)_[^.]+\.dmg/i)
  end

  app "学习通.app"

  zap trash: [
    "/Applications/学习通.app",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.chaoxing.cxstudy.sfl*",
    "~/Library/Preferences/com.chaoxing.cxstudy.plist",
    "~/Library/Saved Application State/com.chaoxing.cxstudy.savedState",
  ]
end
