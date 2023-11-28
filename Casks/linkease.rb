cask "linkease" do
  version "1.1.9"
  sha256 :no_check

  url "https://fw8.koolcenter.com:5000/binary/LinkEase/Client/LinkEase.dmg"
  name "LinkEase"
  desc "一个可以随时随地远程连接个人 文件或设备的私有存储云"
  homepage "https://doc.linkease.com/"

  livecheck do
    url "https://doc.linkease.com/zh/guide/linkease/install/device/support.html"
    regex(%r{macOS.*?v?(\d+(?:\.\d+)+)}i)
  end

  auto_updates true

  app "LinkEase.app"

  zap trash: [
    "~/Library/Caches/com.LinkEase.LinkEase",
    "~/Library/Preferences/com.LinkEase.LinkEase.plist",
    "~/Library/Webkit/com.LinkEase.LinkEase",
  ]
end
