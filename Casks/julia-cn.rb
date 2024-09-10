cask "julia-cn" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.5"
  sha256 arm:   "1d345c3ad2ea3a23197c6ba6c95fdae4d99fa3863ddd9f5664fbd97de67c7c56",
         intel: "2b5cc5bab50c9bedf03cc957e0d4a9d5d357ce32252004b129609af287577c97"

  url "https://mirrors.tuna.tsinghua.edu.cn/julia-releases/bin/mac/#{arch}/#{version.major_minor}/julia-#{version}-mac#{arch.delete_prefix("x")}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/julia-releases/bin/mac/"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  livecheck do
    url "https://julialang.org/downloads/"
    regex(/href=.*?julia-(\d+(\.\d+){2})-mac#{arch.delete_prefix("x")}\.dmg/i)
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
