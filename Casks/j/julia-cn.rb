cask "julia-cn" do
  version "1.11.7"
  sha256 "b00552ab86f027a32359bf70a91ad8ceb6f3b20f9c2ad406677b0e72f854c1a7"

  url "https://mirrors.ustc.edu.cn/julia-releases/bin/mac/aarch64/#{version.major_minor}/julia-#{version}-macaarch64.dmg",
      verified: "mirrors.ustc.edu.cn/julia-releases/bin/mac/"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  livecheck do
    url "https://julialang.org/downloads/"
    regex(/href=.*?julia-(\d+(\.\d+){2})-macaarch64\.dmg/i)
  end

  auto_updates true
  conflicts_with cask: "julia"

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
