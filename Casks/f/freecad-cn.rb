cask "freecad-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.0"
  sha256 arm:   "ec287b388cb94876214678b8f9f586166261883e2591df274a52b19b73d48183",
         intel: "48a38173a7181bd24f647d162488284a94e5cbf8678b15de8bbe41d5dbad4bd4"

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
