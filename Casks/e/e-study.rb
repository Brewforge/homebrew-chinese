cask "e-study" do
  version "4.3.7"
  sha256 :no_check

  url "https://download.cnki.net/CNKI%20E-Study%20For%20Mac.dmg",
      user_agent: :fake,
      referer:    "https://estudy.cnki.net/",
      header:     [
        "CLIENT-IP: 115.239.211.92", # 杭州 IP
        "X-Forwarded-For: 115.239.211.92", # 杭州 IP
      ]
  name "e-study"
  desc "Essential Tools for Brainiacs"
  homepage "https://estudy.cnki.net/"

  livecheck do
    url :homepage
    regex(/Mac(\d+(\.\d+)+)客户端/i)
  end

  auto_updates true

  app "知网研学.app"

  zap trash: [
    "~/Library/HTTPStorages/net.cnki.EStudy",
    "~/Library/HTTPStorages/net.cnki.EStudy.binarycookies",
    "~/Library/Preferences/net.cnki.EStudy.plist",
  ]
end
