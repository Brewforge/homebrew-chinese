cask "mogan-cn" do
  version "2026.2.1"
  sha256 "53765f131e44627ade12c9051de7ea4874f646473bb8df0592f397b43464fdc6"

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
