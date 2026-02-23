cask "mogan-cn" do
  version "2026.2.0"
  sha256 "7b67d56486719f60c7731954cf870cbe3ea1373153da24f13414176eaa80dd01"

  url "https://mirrors.ustc.edu.cn/github-release/XmacsLabs/mogan/LatestRelease/MoganSTEM-v#{version}-arm.dmg",
      verified: "mirrors.ustc.edu.cn/github-release/XmacsLabs/mogan/"
  name "Mogan STEM"
  desc "Structured STEM suite"
  homepage "https://mogan.app/"

  livecheck do
    url "https://mirrors.ustc.edu.cn/github-release/XmacsLabs/mogan/LatestRelease/"
    regex(/MoganSTEM-v(\d{4}(\.\d+)+)-arm\.dmg/i)
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "MoganSTEM.app"

  zap trash: [
    "~/Library/Application Support/XmacsLabs",
    "~/Library/Preferences/app.mogan.plist",
  ]
end
