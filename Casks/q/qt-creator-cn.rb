cask "qt-creator-cn" do
  version "13.0.2"
  sha256 "62b693289102f993d82b39443a783d3b080512b3334db5241c01dcce20b87432"

  url "https://mirrors.tuna.tsinghua.edu.cn/qt/official_releases/qtcreator/#{version.major_minor}/#{version}/qt-creator-opensource-mac-x86_64-#{version}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/"
  name "Qt Creator"
  desc "IDE for application development"
  homepage "https://www.qt.io/developers/"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/qt/official_releases/qtcreator/latest/"
    regex(/qt-creator-opensource-mac-x86_64-(.\d+(\.\d+)+)\.dmg/i)
  end

  auto_updates true
  conflicts_with cask: "qt-creator"
  depends_on macos: ">= :sierra"

  app "Qt Creator.app"

  zap trash: [
    "~/Library/Preferences/com.qtproject.QtCreator.plist",
    "~/Library/Preferences/org.qt-project.qtcreator.plist",
    "~/Library/Saved Application State/org.qt-project.qtcreator.savedState",
  ]
end
