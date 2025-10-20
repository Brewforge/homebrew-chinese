cask "julia-cn" do
  version "1.12.1"
  sha256 "141ab2ac2561d2ab68ca9e35a42cd0defc382439f68dbd8c7d916cf4388aa44b"

  url "https://mirrors.ustc.edu.cn/julia-releases/bin/mac/aarch64/#{version.major_minor}/julia-#{version}-macaarch64.dmg",
      verified: "mirrors.ustc.edu.cn/julia-releases/bin/mac/"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  livecheck do
    # skip "同步问题，暂不更新"
    url "https://julialang.org/downloads/"
    regex(/href=.*?julia-(\d+(\.\d+){2})-macaarch64\.dmg/i)
  end

  auto_updates true
  conflicts_with cask: "julia"
  depends_on macos: ">= :sequoia"

  app "Julia-#{version.major_minor}.app"
  binary "#{appdir}/Julia-#{version.major_minor}.app/Contents/Resources/julia/bin/julia"

  zap trash: [
    "~/.julia",
    "~/Library/Logs/Julia",
    "~/Library/Preferences/com.github.Julia.plist",
    "~/Library/Preferences/julia.plist",
    "~/Library/Saved Application State/com.github.Julia.savedState",
  ]
end
