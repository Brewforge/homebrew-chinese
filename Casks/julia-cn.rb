cask "julia-cn" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.3"
  sha256 arm:   "db2a42130135f2673f1c47a1add229ced85318a7d66cd844948839ae4c62f534",
         intel: "c4d3076bc918b1300edc236f827bc49349a73f4ed577ec5a5e613410363af213"

  url "https://mirrors.tuna.tsinghua.edu.cn/julia-releases/bin/mac/#{arch}/#{version.major_minor}/julia-#{version}-mac#{arch.delete_prefix("x")}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/julia-releases/bin/mac/"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  livecheck do
    url "https://julialang.org/downloads/"
    regex(/href=.*?julia[._-]v?(\d+(?:\.\d+)+)[._-]mac#{arch.delete_prefix("x")}\.dmg/i)
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
