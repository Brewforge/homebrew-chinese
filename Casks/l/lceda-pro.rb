cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "2.2.34.8"
  sha256 arm:   "0adf3ee96c7777cf72f7db11a77b051888648589f89e4050c32ac4fde50fcf23",
         intel: "0adf3ee96c7777cf72f7db11a77b051888648589f89e4050c32ac4fde50fcf23"

   branch = "main"
   url "https://raw.githubusercontent.com/Brewforge/homebrew-chinese/refs/heads/#{branch}/Casks/l/lceda-pro.sh",
       verified: "raw.githubusercontent.com/Brewforge/homebrew-chinese/"
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
    executable: "lceda-pro.sh",
    args:       [
      "https://image.lceda.cn/files/lceda-pro-mac-#{arch}-#{version}.zip",
      "#{staged_path}/lceda-pro-mac-#{arch}-#{version}.zip",
      "#{appdir}",
    ],
  }

  # binary "#{appdir}/LCEDA-Pro.app/Contents/MacOS/LCEDA-Pro"

  uninstall delete: "#{caskroom_path}"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/cn.lceda.pro",
    "~/Library/Saved Application State/cn.lceda.pro.savedState",
    "~/Library/Preferences/cn.lceda.pro.plist",
  ]
end
