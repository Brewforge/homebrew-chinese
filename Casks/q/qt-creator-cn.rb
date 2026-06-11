cask "qt-creator-cn" do
  version "19.0.2"
  sha256 "03970bf55509965ecad6bb5003f4e2623ce33c7b254e049bdfeb4df7e47226f8"

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
