cask "qt-creator-cn" do
  version "20.0.0"
  sha256 "d5b87969f7ffda603bebcb0607dcfa47606dccc4859dfcb1247b40a9152f218c"

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
