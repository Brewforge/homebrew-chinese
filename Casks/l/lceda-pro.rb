cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "2.2.27.1"
  sha256 arm:   "08b116ccde1b15469043d02a45941619c71f06b1c7d475ca640c9bfb15c4bf13",
         intel: "76859d13679e146e7dee72ebc222c8ed348a946b66e5e3e84600131fab3adb6c"

  url "https://image.lceda.cn/files/lceda-pro-mac-#{arch}-#{version}.zip"
  name "LCEDA-Pro"
  desc "高效的国产 PCB 设计工具，永久免费"
  homepage "https://lceda.cn/"

  livecheck do
    url "https://lceda.cn/page/download"
    regex(/lceda-pro-mac-#{arch}-(\d+(\.\d+)+)/i)
  end

  auto_updates true

  # app "LCEDA-Pro.app"

  installer script: {
    executable: "/usr/bin/tar",
    args:       [
      "-xvf",
      "#{staged_path}/lceda-pro-mac-#{arch}-#{version}.zip",
      "*.app/*",
      "-d",
      "/Applications",
    ],
  }
  binary "#{appdir}/LCEDA-Pro.app/Contents/MacOS/LCEDA-Pro"

  uninstall delete: caskroom_path.to_s

  zap trash: ""
end
