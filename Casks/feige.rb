cask "feige" do
  version "7.1.20240101"
  sha256 "bd95bad5c8a31cbaf82fa8e284e2eb719f8963866a81b61ab2f2021d051de878"

  url "http://www.ipmsg.org.cn/Download/Feige_Mac.dmg?#{version}"
  name "Feige"
  desc "面向企业、学校、家庭的局域网即时通讯软件"
  homepage "http://www.ipmsg.org.cn/"

  livecheck do
    url "http://www.ipmsg.org.cn/home/index/download"
    regex(%r{Mac版</h3>[^<]*<i>([^<]+)</i>}i)
  end

  auto_updates true

  app "Feige.app"

  zap trash: [
    "~/ipmsg.db",
    "~/Library/Saved Application State/com.yourcompany.clock.savedState",
    "~/Library/Saved Application State/com.yourcompany.Feige.savedState",
  ]
end
