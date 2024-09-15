cask "chaoxing-cxstudy" do
  arch arm: "arm64", intel: "x64"

  version "1.2.6"
  sha256 arm:   "4be515e597d1d81f1a43175871a7c2cf79f75e02bb8457edf52f3b3f96eb7f6e",
         intel: "34d515a646bdc2b7257ca6d66413a56622d084143e492bb2dc58179a61755d6a"

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
