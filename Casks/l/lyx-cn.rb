cask "lyx-cn" do
  version "2.4.3"
  sha256 "3e9d84622165e519cee8f4d6f4d0d58be4edc8daf1d81eda1c1b6b3adde9ab4b"

  url "https://mirrors.tuna.tsinghua.edu.cn/lyx/bin/#{version.major_minor_patch}/LyX-#{version}+qt5-x86_64-arm64-cocoa.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/lyx/bin/"
  name "LyX"
  desc "GUI document processor based on the LaTeX typesetting system"
  homepage "https://www.lyx.org/"

  livecheck do
    url "https://www.lyx.org/Download"
    regex(/LyX-v?(\d+(?:\.\d+)+)\+qt5/i)
  end

  auto_updates true
  conflicts_with cask: "lyx"
  depends_on macos: ">= :mojave"

  app "LyX.app"
  binary "#{appdir}/LyX.app/Contents/MacOS/inkscape", target: "lyx-inkscape"
  binary "#{appdir}/LyX.app/Contents/MacOS/lyx"
  binary "#{appdir}/LyX.app/Contents/MacOS/lyxclient"
  binary "#{appdir}/LyX.app/Contents/MacOS/lyxconvert"
  binary "#{appdir}/LyX.app/Contents/MacOS/lyxeditor"
  binary "#{appdir}/LyX.app/Contents/MacOS/maxima", target: "lyx-maxima"
  binary "#{appdir}/LyX.app/Contents/MacOS/tex2lyx"

  zap trash: [
    "~/Library/Application Support/LyX-#{version.major_minor}",
    "~/Library/Caches/com.apple.python/Applications/LyX.app",
    "~/Library/Preferences/org.lyx.LyX-#{version.major_minor}.plist",
    "~/Library/Preferences/org.lyx.lyx.plist",
    "~/Library/Saved Application State/org.lyx.lyx.savedState",
  ]
end
