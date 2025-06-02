cask "mogan-research-cn" do
  arch arm: "-arm"

  version "1.2.9.7"
  sha256 arm:   "4b2dbfe74492031f12760701c5f878b98bb1fb2abc2e449f7d692ba2dc4b9939",
         intel: "4727a5889cf289e807b097787a97223a325abfb7d922ab5ff6f2bf706dd33e67"

  url "https://mirrors.ustc.edu.cn/github-release/XmacsLabs/mogan/LatestRelease/MoganResearch-v#{version}#{arch}.dmg",
      verified: "mirrors.ustc.edu.cn/github-release/XmacsLabs/mogan/LatestRelease/"
  name "Mogan Research"
  desc "Structured STEM suite"
  homepage "https://mogan.app/"

  livecheck do
    url "https://mirrors.ustc.edu.cn/github-release/XmacsLabs/mogan/LatestRelease/"
    regex(/MoganResearch-v?(\d+(?:\.\d+)+)\.dmg/i)
  end

  app "MoganResearch.app"

  zap trash: [
    "~/Library/Application Support/XmacsLabs",
    "~/Library/Saved Application State/app.mogan.research.savedState",
  ]
end
