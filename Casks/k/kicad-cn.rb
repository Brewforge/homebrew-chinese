cask "kicad-cn" do
  version "9.0.0-rc2"
  sha256 "70dfe1c085c301fe1b14623bf7f8dea87d6f30f6490ed551aae1f1e3fd005c9c"

  url "https://mirrors.bfsu.edu.cn/kicad/osx/stable/kicad-unified-universal-#{version}.dmg",
      verified: "mirrors.bfsu.edu.cn/kicad/"
  name "KiCad"
  desc "Electronics design automation suite"
  homepage "https://kicad.org/"

  livecheck do
    url "https://mirrors.bfsu.edu.cn/kicad/osx/stable/"
    regex(/kicad-unified-universal-(\d+(?:\.\d+)+(-rc\d+)?)/i)
  end

  depends_on macos: ">= :big_sur"

  suite "KiCad"
  binary "KiCad/KiCad.app/Contents/MacOS/dxf2idf"
  binary "KiCad/KiCad.app/Contents/MacOS/idf2vrml"
  binary "KiCad/KiCad.app/Contents/MacOS/idfcyl"
  binary "KiCad/KiCad.app/Contents/MacOS/idfrect"
  binary "KiCad/KiCad.app/Contents/MacOS/kicad-cli"
  artifact "demos", target: "/Library/Application Support/kicad/demos"

  zap trash: [
    "/Library/Application Support/kicad",
    "~/Library/Application Support/kicad",
    "~/Library/Preferences/kicad",
    "~/Library/Preferences/org.kicad-pcb.*",
    "~/Library/Saved Application State/org.kicad-pcb.*",
  ]
end
