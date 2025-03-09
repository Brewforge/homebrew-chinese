cask "obs-cn" do
  arch arm: "Apple", intel: "Intel"
  on_arch_conditional arm: "arm64", intel: "x86_64"

  version "31.0.2"
  sha256 arm:   "d028ec5471869142e60c3ae886e0d2d333b14ce6001a87effe545a1754cfff24",
         intel: "d4ff2577c36c0b1c1882a0ca8b22ff76cba480eef1de47d555335c5baa3c062f"

  url "https://mirrors.bfsu.edu.cn/github-release/obsproject/obs-studio/LatestRelease/OBS-Studio-#{version}-macOS-#{arch}.dmg",
      verified: "mirrors.bfsu.edu.cn/"
  name "OBS"
  desc "Open-source software for live streaming and screen recording"
  homepage "https://obsproject.com/"

  livecheck do
    url "https://mirrors.bfsu.edu.cn/github-release/obsproject/obs-studio/LatestRelease"
    regex(/OBS-Studio-(\d+(\.\d+){2})-macos-#{arch}\.dmg/i)
  end

  auto_updates true
  conflicts_with cask: ["homebrew/cask-versions/obs-beta", "obs"]
  depends_on macos: ">= :catalina"

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
