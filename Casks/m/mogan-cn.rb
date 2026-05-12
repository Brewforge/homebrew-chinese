cask "mogan-cn" do
  version "2026.2.4"
  sha256 "b3b819efe1d60b1351faf6c364c960604f81b7c212dc0e68b6829efd0e1ec9db"

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
  depends_on macos: :sonoma

  app "MoganSTEM.app"

  zap trash: [
    "~/Library/Application Support/XmacsLabs",
    "~/Library/Preferences/app.mogan.plist",
  ]
end
