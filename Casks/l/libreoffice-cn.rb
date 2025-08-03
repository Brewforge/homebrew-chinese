cask "libreoffice-cn" do
  arch arm: "aarch64", intel: "x86-64"

  version "25.2.4"
  sha256 arm:   "d0f8573dfc5d1a858061a9bc7889313cb6837db8a8f1b568d067ca156c03745e",
         intel: "88746b5e46a72ae964ed2275399ee0fb2a0712f6d93a30b151358ffa0ea8349a"

  url "https://mirrors.aliyun.com/libreoffice/stable/#{version}/mac/#{arch}/LibreOffice_#{version}_MacOS_#{arch}.dmg",
      verified: "mirrors.aliyun.com/libreoffice/stable/"
  name "LibreOffice"
  desc "Office suite"
  homepage "https://libreoffice.org/"

  livecheck do
    url "https://mirrors.aliyun.com/libreoffice/stable/"
    regex(%r{href="(\d+(?:\.\d+)+)/mac"}i)
  end

  auto_updates true
  conflicts_with cask: ["homebrew/cask-versions/libreoffice-still", "libreoffice"]
  depends_on macos: ">= :sierra"

  app "LibreOffice.app"
  binary "#{appdir}/LibreOffice.app/Contents/MacOS/gengal"
  binary "#{appdir}/LibreOffice.app/Contents/MacOS/regview"
  binary "#{appdir}/LibreOffice.app/Contents/MacOS/senddoc"
  binary "#{appdir}/LibreOffice.app/Contents/MacOS/uno"
  binary "#{appdir}/LibreOffice.app/Contents/MacOS/unoinfo"
  binary "#{appdir}/LibreOffice.app/Contents/MacOS/unopkg"
  binary "#{appdir}/LibreOffice.app/Contents/MacOS/uri-encode"
  binary "#{appdir}/LibreOffice.app/Contents/MacOS/xpdfimport"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/soffice.wrapper.sh"
  binary shimscript, target: "soffice"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      '#{appdir}/LibreOffice.app/Contents/MacOS/soffice' "$@"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.libreoffice.script.sfl*",
    "~/Library/Application Support/LibreOffice",
    "~/Library/Preferences/org.libreoffice.script.plist",
    "~/Library/Saved Application State/org.libreoffice.script.savedState",
  ]
end
