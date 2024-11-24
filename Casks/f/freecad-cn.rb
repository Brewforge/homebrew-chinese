cask "freecad-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "0.21.2"
  sha256 arm:   "88f51e816075c586bcde89eab0b5edc4a260294eefc11bf5a917d7818330ad50",
         intel: "e22dfd804c2b09aa559cd3ec2de6e1d7321022c04a354857fc9936b7b6d2e5bb"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/FreeCAD/FreeCAD/LatestRelease/FreeCAD_#{version}-conda-macOS-#{arch}-py311.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/github-release/FreeCAD/FreeCAD/"
  name "FreeCAD"
  desc "3D parametric modeler"
  homepage "https://www.freecadweb.org/"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/github-release/FreeCAD/FreeCAD/LatestRelease/"
    regex(%r{FreeCAD_(\d+(\.\d+){2})-conda-macOS.+/}i)
  end

  auto_updates true
  depends_on macos: ">= :sierra"

  app "FreeCAD.app"

  zap trash: [
    "~/Library/Application Support/FreeCAD",
    "~/Library/Caches/FreeCAD",
    "~/Library/Preferences/com.freecad.FreeCAD.plist",
    "~/Library/Preferences/FreeCAD",
  ]
end
