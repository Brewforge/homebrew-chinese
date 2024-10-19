cask "chaoxing-cxstudy" do
  arch arm: "arm64", intel: "x64"

  version "1.2.8"
  sha256 arm:   "1795ef67bb61670ac1f9f97dd5a3e593d53b167e8a85b67c81a54a9f813dca3d",
         intel: "5b440a7e2ce8985cc8d1c8e75ffed45bdd4e9e46ee107b8865ab61514734d7b7"

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
