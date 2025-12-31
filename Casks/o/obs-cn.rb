cask "obs-cn" do
  arch arm: "Apple", intel: "Intel"

  version "32.0.4"
  sha256 arm:   "7c056644636a794cb18281af98d54b5795ad8b0985e950d93b8c510b645b6298",
         intel: "7d610f5ab1c9d14290d827e449b2cc9ed99bb8b49a890d1cacf0611acebe44fa"

  url "https://mirror.lzu.edu.cn/github-release/obsproject/obs-studio/LatestRelease/OBS-Studio-#{version}-macOS-#{arch}.dmg",
      verified: "mirror.lzu.edu.cn/"
  name "OBS"
  desc "Open-source software for live streaming and screen recording"
  homepage "https://obsproject.com/"

  livecheck do
    url "https://mirror.lzu.edu.cn/github-release/obsproject/obs-studio/LatestRelease"
    regex(/OBS-Studio-(\d+(\.\d+){2})-macOS-#{arch}\.dmg/i)
  end

  auto_updates true
  conflicts_with cask: ["obs@beta", "obs"]
  depends_on macos: ">= :monterey"

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
