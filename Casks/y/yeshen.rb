cask "yeshen" do
  version "3.8.5.7"
  sha256 "abb63b2195c9f51232141ade92608b0f60779d89c3564b1b078e431693f24506"

  url "https://www.yeshen.com/cn/download/fullPackage/mac_fullzip?beta",
      user_agent: :fake
  name "夜神模拟器"
  desc "电脑玩手游的神兵利器"
  homepage "https://www.yeshen.com/"

  livecheck do
    url :homepage
    regex(/Mac版本： (\d+(\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :sierra"

  installer script: {
    executable: "#{staged_path}/夜神模拟器安装器.app/Contents/MacOS/NoxInstaller",
  }
  binary "/Applications/NoxAppPlayer.app/Contents/NoxAppPlayer"

  uninstall delete: "/Applications/NoxAppPlayer.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.nox.NoxAppPlayer",
    "~/Library/Application Support/NoxAppPlayer"
  ]
end
