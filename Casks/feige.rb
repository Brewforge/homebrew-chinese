cask "feige" do
  version "2.0.220328"
  sha256 "bd95bad5c8a31cbaf82fa8e284e2eb719f8963866a81b61ab2f2021d051de878"

  url "http://www.ipmsg.org.cn/Download/Feige_Mac.dmg"
  name "Feige"
  desc "面向企业、学校、家庭的局域网即时通讯软件"
  homepage "http://www.ipmsg.org.cn/"

  auto_updates true

  livecheck do
    url 'http://www.ipmsg.org.cn/home/index/download'
    regex(/Mac版<\/h3>[^<]*<i>([^<]+)<\/i>/i)
  end

  app "Feige.app"

  zap trash: [
    "~/Library/Saved Application State/com.yourcompany.clock.savedState",
    "~/Library/Saved Application State/com.yourcompany.Feige.savedState",
    "~/ipmsg.db",
  ]
end
