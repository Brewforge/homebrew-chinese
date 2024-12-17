cask "linkease" do
  version "1.30"
  sha256 :no_check

  url "https://fw.koolcenter.com/binary/LinkEase/Client/LinkEase.dmg",
      verified: "fw.koolcenter.com/binary/"
  name "LinkEase"
  desc "一个可以随时随地远程连接个人 文件或设备的私有存储云"
  homepage "https://www.linkease.com/"

  livecheck do
    url "https://doc.linkease.com/zh/guide/linkease/install/device/support.html"
    regex(/macOS.*?v?(\d+(?:\.\d+)+)/i)
  end

  auto_updates true

  app "LinkEase.app"

  zap trash: [
    "~/Library/Caches/com.LinkEase.LinkEase",
    "~/Library/Preferences/com.LinkEase.LinkEase.plist",
    "~/Library/Webkit/com.LinkEase.LinkEase",
  ]

  caveats do
    requires_rosetta
  end
end
