cask "mogan-cn" do
  arch arm: "-arm"

  version "2025.1.1"
  sha256 arm:   "51cfa0e6bddeaa0ae6a9f0aede6018c1590ae9fd607dc4a45b7186b876852335",
         intel: "ca15ad19217ab6808984845911b1620981af379f96fd8d309877b57f39cda445"

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
