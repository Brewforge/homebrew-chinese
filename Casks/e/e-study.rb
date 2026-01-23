cask "e-study" do
  version "4.4.1,378"
  sha256 "50d5d56e3b450f34d7dc35aa46e596547aab6d3363a16df3e86e806ae5399103"

  url "https://piccachex.cnki.net/estudy/CNKI%20E-Study%20For%20Mac#{version.csv.first}.dmg"
  name "estudy"
  name "知网研学"
  desc "汇聚中外资源、AI研读、AI文献综述、知识体系构建"
  homepage "https://estudy.cnki.net/"

  livecheck do
    url :url
    strategy :extract_plist
  end

  auto_updates true

  app "知网研学.app"

  zap trash: [
    "~/Library/Caches/net.cnki.EStudy",
    "~/Library/HTTPStorages/net.cnki.EStudy",
    "~/Library/HTTPStorages/net.cnki.EStudy.binarycookies",
    "~/Library/Preferences/net.cnki.EStudy.plist",
  ]
end
