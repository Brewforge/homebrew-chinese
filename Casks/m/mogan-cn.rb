cask "mogan-cn" do
  version "2026.3.8"
  sha256 "1e6a159d00eb5474da9c13c33d6c503daa827545ec2a63d6b5deb6e45cb71719"

  url "https://mirrors.ustc.edu.cn/github-release/XmacsLabs/mogan/LatestRelease/mogan-release-#{version}-osx-arm64-stable.zip"
  name "Mogan STEM"
  desc "Structured STEM suite"
  homepage "https://mogan.app/"

  livecheck do
    url "https://mirrors.ustc.edu.cn/github-release/XmacsLabs/mogan/LatestRelease/"
    regex(/mogan-release-(\d{4}(\.\d+)+)-osx-arm64-stable\.zip/i)
  end

  depends_on macos: :sonoma
  container nested: "MoganSTEM-v#{version}-arm64-stable-Portable.zip"

  app "MoganSTEM.app"

  zap trash: [
    "~/Library/Application Support/XmacsLabs",
    "~/Library/Preferences/app.mogan.plist",
  ]
end
