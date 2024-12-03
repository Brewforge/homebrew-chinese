cask "julia-cn" do
  arch arm: "aarch64", intel: "x64"

  version "1.11.2"
  sha256 arm:   "1d73bc98c004acc8eb680ecc75f27d232210b9838612cd2130a25bfba52d1c33",
         intel: "f467c2cbf75b4deeeb07673ff1a3e79fdc59b336b97ebffbd2a8eb6b4dda61cb"

  url "https://mirrors.bfsu.edu.cn/julia-releases/bin/mac/#{arch}/#{version.major_minor}/julia-#{version}-mac#{arch.delete_prefix("x")}.dmg",
      verified: "mirrors.bfsu.edu.cn/julia-releases/bin/mac/"
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
