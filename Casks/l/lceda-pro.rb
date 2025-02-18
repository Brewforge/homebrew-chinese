cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "2.2.36.5"
  sha256 arm:   "8842a83563fba8557d6dc8ae79cac63cb8fbe9f16027a12723b319d3aca431c8",
         intel: "8842a83563fba8557d6dc8ae79cac63cb8fbe9f16027a12723b319d3aca431c8"

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
      appdir.to_s,
    ],
  }

  # binary "#{appdir}/LCEDA-Pro.app/Contents/MacOS/LCEDA-Pro"

  uninstall delete: caskroom_path.to_s

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/cn.lceda.pro",
    "~/Library/Application Support/JLCEDA Pro",
    "~/Library/Preferences/cn.lceda.pro.plist",
    "~/Library/Saved Application State/cn.lceda.pro.savedState",
  ]
end
