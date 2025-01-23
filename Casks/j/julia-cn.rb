cask "julia-cn" do
  arch arm: "aarch64", intel: "x64"

  version "1.11.3"
  sha256 arm:   "0ea25e12f81dae228e209fbf81dd9ec2260aa7a2860031d4450744812589862e",
         intel: "c59d57cb07b2fb9b38a060ff80f6177804159832232474f56eac720792c626a5"

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
