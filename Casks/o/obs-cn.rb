cask "obs-cn" do
  arch arm: "Apple", intel: "Intel"

  version "32.0.3"
  sha256 arm:   "5efd7ec3871fa5f217644425e6777354716425dd25c0759c9373b163cc9de6e8",
         intel: "5a74b72ef4b00c655cdb50215bb9455d529542f1d32d119b1747feee2ec77166"

  url "https://mirror.nju.edu.cn/github-release/obsproject/obs-studio/LatestRelease/OBS-Studio-#{version}-macOS-#{arch}.dmg",
      verified: "mirror.nju.edu.cn/"
  name "OBS"
  desc "Open-source software for live streaming and screen recording"
  homepage "https://obsproject.com/"

  livecheck do
    url "https://mirror.nju.edu.cn/github-release/obsproject/obs-studio/LatestRelease"
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
