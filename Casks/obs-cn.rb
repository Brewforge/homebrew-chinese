cask "obs-cn" do
  arch arm: "Apple", intel: "Intel"
  on_arch_conditional arm: "arm64", intel: "x86_64"

  version "30.2.0"
  sha256 arm:   "af450d7a5290d52fe9c3bf55fae4a54367fcba7113d248d2237b3aa3ed5a2d20",
         intel: "2048fc2686fbf2468cde75438ca1d9e3f4b65ba19e67b1889b4b4752db8d592e"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/obsproject/obs-studio/LatestRelease/OBS-Studio-#{version}-macOS-#{arch}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/"
  name "OBS"
  desc "Open-source software for live streaming and screen recording"
  homepage "https://obsproject.com/"

  livecheck do
    url "https://mirrors.tuna.tsinghua.edu.cn/github-release/obsproject/obs-studio/LatestRelease"
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
