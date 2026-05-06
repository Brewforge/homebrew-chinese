cask "mogan-cn" do
  version "2026.2.3"
  sha256 "fced6c00974d689bbe530463cf2a3e0c8bf41dc47a2445b532f44cf7576104c6"

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
