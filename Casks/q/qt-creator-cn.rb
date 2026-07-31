cask "qt-creator-cn" do
  version "20.0.1"
  sha256 "f18ebb715619f2092e1816498e34c989b75c269bfc948169f1dd76e0231b5fa0"

  url "https://mirrors.ustc.edu.cn/qtproject/official_releases/qtcreator/latest/qt-creator-opensource-mac-universal-#{version}.dmg",
      verified: "mirrors.ustc.edu.cn/"
  name "Qt Creator"
  desc "IDE for application development"
  homepage "https://qt.io/developers/"

  livecheck do
    url "https://mirrors.ustc.edu.cn/qtproject/official_releases/qtcreator/latest/"
    regex(/qt-creator-opensource-mac-universal-(.\d+(\.\d+)+)\.dmg/i)
  end

  conflicts_with cask: "qt-creator"
  depends_on macos: :ventura

  app "Qt Creator.app"

  zap trash: [
    "~/Library/Preferences/com.qtproject.QtCreator.plist",
    "~/Library/Preferences/org.qt-project.qtcreator.plist",
    "~/Library/Saved Application State/org.qt-project.qtcreator.savedState",
  ]
end
