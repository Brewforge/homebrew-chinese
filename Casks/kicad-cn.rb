cask "kicad-cn" do
  version "8.0.2-rc1"
  sha256 "868d1b00f5e597521c68d7c9d06bd21cda181c2d594ac6f6801f22b81e01731b"

  url "https://mirrors.tuna.tsinghua.edu.cn/kicad/osx/stable/kicad-unified-universal-#{version}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/kicad/"
  name "KiCad"
  desc "Electronics design automation suite"
  homepage "https://kicad.org/"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/kicad/osx/stable/"
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
