cask "obs-cn" do
  arch arm: "Apple", intel: "Intel"
  on_arch_conditional arm: "arm64", intel: "x86_64"

  version "31.0.4"
  sha256 arm:   "34a1b984cd3af81245f8cae884bca04ce99cb2d7e673b2c572cbe90eb7f5b817",
         intel: "f54615c30de01644a5b6217f97d4d98e1eb01fa13d778bf33a847acf4f33a132"

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
