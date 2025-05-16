cask "freecad-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.1"
  sha256 arm:   "38608bbf63140e0eb102a43708a19482234b9f97e447b140e945680777c43393",
         intel: "8ddfde6700b6aee3d6296886ead72b6607281b151abaecf662ac6b12c8f0d8c2"

  url "https://mirrors.bfsu.edu.cn/github-release/FreeCAD/FreeCAD/LatestRelease/FreeCAD_#{version}-conda-macOS-#{arch}-py311.dmg",
      verified: "mirrors.bfsu.edu.cn/github-release/FreeCAD/FreeCAD/"
  name "FreeCAD"
  desc "3D parametric modeler"
  homepage "https://freecadweb.org/"

  livecheck do
    url "https://mirrors.bfsu.edu.cn/github-release/FreeCAD/FreeCAD/LatestRelease/"
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
