cask "capcut-cn" do
  version "0_1.2.14"
  sha256 :no_check

  url "https://lf3-package.vlabstatic.com/obj/faceu-packages/installer/jianying_jianyingpro_#{version}_installer.dmg",
      verified: "lf3-package.vlabstatic.com/obj/faceu-packages/installer/"
  name "剪映专业版"
  desc "全能易用的桌面端剪辑软件，让创作更简单"
  homepage "https://www.capcut.cn/"

  livecheck do
    "No Infomation Available Found"
  end

  auto_updates true

  installer script: {
    executable: "jianying-installer.app/Contents/MacOS/jianying-installer",
    args:       ["-q"],
  }

  uninstall quit:       "/Applications/VideoFusion-macOS.app/Contents/MacOS/VideoFusion-macOS",
            login_item: "剪映专业版",
            delete:     "/Applications/剪映专业版.app"

  zap trash: [
    "/Applications/VideoFusion-macOS.app",
    "~/Library/Application Scripts/com.lemon.lvpro",
    "~/Library/Application Scripts/X2JNK7LY8J.lv",
    "~/Library/Application Scripts/X2JNK7LY8J.ve",
    "~/Library/Containers/com.lemon.lvpro",
    "~/Library/Group Containers/X2JNK7LY8J.lv",
    "~/Library/Group Containers/X2JNK7LY8J.ve",
  ]
end
