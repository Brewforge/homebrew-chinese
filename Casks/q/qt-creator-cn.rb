cask "qt-creator-cn" do
  version "17.0.0"
  sha256 "68c59ff25f73ebe3ca55e847c0c8dbb49c0dca284b49d5efe6db1633323d745a"

  url "https://mirrors.ustc.edu.cn/qtproject/official_releases/qtcreator/#{version.major_minor}/#{version}/qt-creator-opensource-mac-x86_64-#{version}.dmg",
      verified: "mirrors.ustc.edu.cn/"
  name "Qt Creator"
  desc "IDE for application development"
  homepage "https://qt.io/developers/"

  livecheck do
    url "https://mirrors.ustc.edu.cn/qtproject/official_releases/qtcreator/latest/"
    regex(/qt-creator-opensource-mac-x86_64-(.\d+(\.\d+)+)\.dmg/i)
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
