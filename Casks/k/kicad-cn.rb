cask "kicad-cn" do
  version "9.0.6"
  sha256 "ebf2d6e1d94db27baf4f9461205a782170d8a9069123520847b9c779540ae84b"

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
