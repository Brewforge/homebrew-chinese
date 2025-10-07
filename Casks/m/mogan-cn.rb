cask "mogan-cn" do
  arch arm: "-arm"

  version "2025.1.4"
  sha256 arm:   "e2c79faf4446ee8c78ad43816c416aa22f5017ecb4706f192b6f6ac7b36e1645",
         intel: "c44829a4e6c1f6d2cf365d7e7affae4e6cdd5854eac1cf8a1417f80dc872358c"

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
