cask "feige" do
  version "7.1"
  sha256 "c072ce90c939ea56deeac1c58896b78fccf003f06a8efeef3d286725f9777d85"

  url "http://www.ipmsg.org.cn/Download/Feige-#{version}-x86_64.dmg"
  name "Feige"
  desc "面向企业、学校、家庭的局域网即时通讯软件"
  homepage "http://www.ipmsg.org.cn/"

  livecheck do
    url :homepage
    regex(%r{href=.*?/feige[._-]v?(\d+(?:\.\d+)+)[._-]x86_64\.dmg}i)
  end

  auto_updates true

  app "Feige.app"

  zap trash: [
    "~/ipmsg.db",
    "~/Library/Saved Application State/com.yourcompany.clock.savedState",
    "~/Library/Saved Application State/com.yourcompany.Feige.savedState",
  ]
end
