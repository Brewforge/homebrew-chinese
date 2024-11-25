cask "vlc-cn" do
  arch arm: "arm64", intel: "intel64"

  version "3.0.21"
  sha256 arm:   "15dd65bf6489da9ec6a67f5585c74c40a58993acff41a82958a916dd74178044",
         intel: "d431fd051c3dc7af02bd313c6d05d90cf604b70ed3ec5bba6fd4c49ef3e638d9"

  url "https://mirrors.bfsu.edu.cn/videolan-ftp/vlc/last/macosx/vlc-#{version}-#{arch}.dmg",
      verified: "mirrors.bfsu.edu.cn/videolan-ftp/vlc/"
  name "VLC media player"
  desc "Multimedia player"
  homepage "https://www.videolan.org/vlc/"

  livecheck do
    url "https://mirrors.bfsu.edu.cn/videolan-ftp/vlc/last/macosx"
    regex(/vlc-(\d+(\.\d+){2})-#{arch}\.dmg/i)
  end

  auto_updates true
  conflicts_with cask: ["homebrew/cask-versions/vlc-nightly", "vlc"]

  app "VLC.app"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/vlc.wrapper.sh"
  binary shimscript, target: "vlc"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec '#{appdir}/VLC.app/Contents/MacOS/VLC' "$@"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.videolan.vlc.sfl*",
    "~/Library/Application Support/org.videolan.vlc",
    "~/Library/Application Support/VLC",
    "~/Library/Caches/org.videolan.vlc",
    "~/Library/Preferences/org.videolan.vlc",
    "~/Library/Preferences/org.videolan.vlc.plist",
    "~/Library/Saved Application State/org.videolan.vlc.savedState",
  ]
end
