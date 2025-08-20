cask "linkease" do
  version "1.7.4"
  sha256 :no_check

  url "https://fw.koolcenter.com/binary/LinkEase/Client/LinkEase.dmg",
      verified: "fw.koolcenter.com/binary/"
  name "LinkEase"
  desc "一个可以随时随地远程连接个人 文件或设备的私有存储云"
  homepage "https://main.linkease.com/"

  livecheck do
    skip "未找到可用信息"
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
