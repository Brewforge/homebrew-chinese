cask "qt-creator-cn" do
  version "19.0.0"
  sha256 "ecea6481a4c78e50f2cb58bdc2dc49a33c0c08dc019da72b7cd15464bc258d22"

  url "https://mirrors.ustc.edu.cn/qtproject/official_releases/qtcreator/latest/qt-creator-opensource-mac-universal-#{version}.dmg",
      verified: "mirrors.ustc.edu.cn/"
  name "Qt Creator"
  desc "IDE for application development"
  homepage "https://qt.io/developers/"

  livecheck do
    url "https://mirrors.ustc.edu.cn/qtproject/official_releases/qtcreator/latest/"
    regex(/qt-creator-opensource-mac-universal-(.\d+(\.\d+)+)\.dmg/i)
  end

  auto_updates true
  conflicts_with cask: "qt-creator"
  depends_on macos: ">= :ventura"

  app "Qt Creator.app"

  zap trash: [
    "~/Library/Preferences/com.qtproject.QtCreator.plist",
    "~/Library/Preferences/org.qt-project.qtcreator.plist",
    "~/Library/Saved Application State/org.qt-project.qtcreator.savedState",
  ]
end
