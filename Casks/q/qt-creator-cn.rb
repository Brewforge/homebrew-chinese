cask "qt-creator-cn" do
  version "20.0.2"
  sha256 "810e0ef687adf9f6d551e22a9872ad7360d7f0dd1b9862ae7abd0a4f87921a92"

  url "https://mirrors.ustc.edu.cn/qtproject/official_releases/qtcreator/latest/qt-creator-opensource-mac-universal-#{version}.dmg"
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
