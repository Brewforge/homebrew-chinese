cask "libreoffice-cn" do
  arch arm: "aarch64", intel: "x86-64"
  folder = on_arch_conditional arm: "aarch64", intel: "x86_64"

  version "25.2.5"
  sha256 arm:   "0f1e170818508c238ea3fc48753ba264c3dbbce0270655fe020f415f0deef0f0",
         intel: "1cb2cc12f26757cb3df282854c80edd17857ece679a6b30b6391b0dc95f6f504"

  url "https://mirrors.tuna.tsinghua.edu.cn/libreoffice/libreoffice/stable/#{version}/mac/#{folder}/LibreOffice_#{version}_MacOS_#{arch}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/libreoffice/libreoffice/stable/"
  name "LibreOffice"
  desc "Office suite"
  homepage "https://libreoffice.org/"

  livecheck do
    url "https://wiki.documentfoundation.org/Main_Page"
    regex(/>\s*Download\s+LibreOffice\s+v?(\d+(?:\.\d+)+)\s*</im)
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
