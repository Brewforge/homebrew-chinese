cask "chaoxing-cxstudy" do
  arch arm: "arm64", intel: "x64"

  version "1.2.7"
  sha256 arm:   "a144a034fc738deaaf95e9bc6e23afc09dcd72c4e63a2e837ef4f88a0d45c810",
         intel: "cf2722d4d7370e6db64f9073b1e37a474d6d0ec6b971556aeac0c34cead9f150"

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
