cask "mogan-cn" do
  arch arm: "-arm"

  version "2025.1.0"
  sha256 arm:   "16f19adbe53841b6d1e3631862c8e90b6441cb444cfd3ec6939084ffbaa38fbf",
         intel: "01dd079a5f4fe01fc8bb114c922b2ccf2affa03cde64f0bfd2ab1a47312d96ae"

  url "https://mirrors.ustc.edu.cn/github-release/XmacsLabs/mogan/LatestRelease/MoganSTEM-v#{version}#{arch}.dmg",
      verified: "mirrors.ustc.edu.cn/github-release/XmacsLabs/mogan/LatestRelease/"
  name "Mogan Research"
  desc "Structured STEM suite"
  homepage "https://mogan.app/"

  livecheck do
    url "https://mirrors.ustc.edu.cn/github-release/XmacsLabs/mogan/LatestRelease/"
    regex(/MoganSTEM-v?(\d+(\.\d+){2})\.dmg/i)
  end

  app "MoganSTEM.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/app.mogan",
    "~/Library/Application Support/XmacsLabs",
    "~/Library/Preferences/app.mogan.plist",
  ]
end
