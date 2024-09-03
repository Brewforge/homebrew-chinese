cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "2.2.25.6"
  sha256 arm: "bce33afcde33c9204c47ec4fe6e59b1593313ee12f71ad112180899aa540aae2",
         intel: "76859d13679e146e7dee72ebc222c8ed348a946b66e5e3e84600131fab3adb6c"

  url "https://image.lceda.cn/files/lceda-pro-mac-#{arch}-#{version}.zip"
  name "嘉立创EDA(专业版)"
  desc "高效的国产PCB设计工具，永久免费"
  homepage "https://lceda.cn/"

  auto_updates true

  installer script: {
    executable: "/usr/local/bin/unzip",
    args: [
      "-j",
      "#{staged_path}/lceda-pro-mac-#{arch}-#{version}.zip",
      "*.app/*",
      "-d",
      "/Applications"
    ],
  }

  # 不需要 app stanza，因为我们在 preflight 中手动移动了应用
  # app "LCEDA-Pro.app"

  zap trash: [
    # 添加需要清理的文件或目录
  ]
end
