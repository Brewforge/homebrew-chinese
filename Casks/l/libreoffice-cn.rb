cask "libreoffice-cn" do
  arch arm: "aarch64", intel: "x86-64"
  folder = on_arch_conditional arm: "aarch64", intel: "x86_64"

  version "24.8.4"
  sha256 arm:   "cef2ac5ae8dda894cdd86c97bcd6da72ede81e78b1afa7d99d8676ac135ae114",
         intel: "4322f7bda190887605acbdd73cd568d55ac366ca1f2cda82b029ef3de9ae071a"

  url "https://mirrors.bfsu.edu.cn/libreoffice/libreoffice/stable/#{version}/mac/#{folder}/LibreOffice_#{version}_MacOS_#{arch}.dmg",
      verified: "mirrors.bfsu.edu.cn/libreoffice/libreoffice/stable/"
  name "LibreOffice"
  desc "Office suite"
  homepage "https://www.libreoffice.org/"

  livecheck do
    # url "https://mirrors.bfsu.edu.cn/libreoffice/libreoffice/stable/"
    # regex(%r{href="(\d+(?:\.\d+)+)/"}i)
    skip "镜像故障，暂时跳过"
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
