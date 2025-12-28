cask "kicad-cn" do
  version "9.0.7-rc2"
  sha256 "9a7953891ce7d32645f6fa5466b3c17842eb554fd89ab767771e02d12d585f87"

  url "https://mirror.nju.edu.cn/kicad/osx/stable/kicad-unified-universal-#{version}.dmg",
      verified: "mirror.nju.edu.cn/kicad/"
  name "KiCad"
  desc "Electronics design automation suite"
  homepage "https://kicad.org/"

  livecheck do
    url "https://mirror.nju.edu.cn/kicad/osx/stable/"
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
