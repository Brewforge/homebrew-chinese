cask "qt-creator-cn" do
  version "15.0.0"
  sha256 "e464d059934a33a46339da25ce31a986710efcf316139f5e0e1eaec713cbb2fc"

  url "https://mirrors.bfsu.edu.cn/qt/official_releases/qtcreator/#{version.major_minor}/#{version}/qt-creator-opensource-mac-x86_64-#{version}.dmg",
      verified: "mirrors.bfsu.edu.cn/"
  name "Qt Creator"
  desc "IDE for application development"
  homepage "https://www.qt.io/developers/"

  livecheck do
    url "https://mirrors.bfsu.edu.cn/qt/official_releases/qtcreator/latest/"
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
