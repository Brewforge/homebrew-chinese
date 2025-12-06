cask "obs-cn" do
  arch arm: "apple", intel: "intel"

  version "32.0.2"
  sha256 arm:   "5c8f0e2349e45b57512e32312b053688e0b2bb9f0e8de8e7e24ee392e77a7cb3",
         intel: "ad5613bf36d95f8917fe56b127359b48595671e7341dc997202bb15242a53466"

  url "https://mirror.nju.edu.cn/github-release/obsproject/obs-studio/LatestRelease/obs-studio-#{version}-macos-#{arch}.dmg",
      verified: "mirror.nju.edu.cn/"
  name "OBS"
  desc "Open-source software for live streaming and screen recording"
  homepage "https://obsproject.com/"

  livecheck do
    url "https://mirror.nju.edu.cn/github-release/obsproject/obs-studio/LatestRelease"
    regex(/OBS-Studio-(\d+(\.\d+){2})-macos-#{arch}\.dmg/i)
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
