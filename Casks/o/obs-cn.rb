cask "obs-cn" do
  arch arm: "Apple", intel: "Intel"

  version "32.2.0"
  sha256 arm:   "e4bed7f871efa8f2bb5b31d1bbdbde1d0b1016062050f5eab03fd16d44f7a04d",
         intel: "7c8cccd19db5771aaa3a803124534b2e9dbf0ebe5ce1c7cee78baaa54c2e21da"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/obsproject/obs-studio/LatestRelease/OBS-Studio-#{version}-macOS-#{arch}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/"
  name "OBS"
  desc "Open-source software for live streaming and screen recording"
  homepage "https://obsproject.com/"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/github-release/obsproject/obs-studio/LatestRelease"
    regex(/OBS-Studio-(\d+(\.\d+){2})-macOS-#{arch}\.dmg/i)
  end

  conflicts_with cask: ["obs@beta", "obs"]
  depends_on macos: :monterey

  app "OBS.app"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/obs.wrapper.sh"
  binary shimscript, target: "obs"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/bash
      exec '#{appdir}/OBS.app/Contents/MacOS/OBS' "$@"
    EOS
  end

  uninstall delete: "/Library/CoreMediaIO/Plug-Ins/DAL/obs-mac-virtualcam.plugin"

  zap trash: [
    "~/Library/Application Support/obs-studio",
    "~/Library/HTTPStorages/com.obsproject.obs-studio",
    "~/Library/Preferences/com.obsproject.obs-studio.plist",
    "~/Library/Saved Application State/com.obsproject.obs-studio.savedState",
  ]
end
