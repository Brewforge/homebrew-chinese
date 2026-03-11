cask "julia@lts-cn" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.10"
  sha256 arm:   "7283a27f8a8c12495fbba8cbf38e5b284fecaba9d54da1e0f8d6d8cedb4f4d92",
         intel: "18c0daffdc4504116d2e29e96b0b81ad98d20c88196d48d377ccffb71ab0ca73"

  url "https://mirrors.ustc.edu.cn/julia-releases/bin/mac/#{arch}/#{version.major_minor}/julia-#{version}-mac#{arch.delete_prefix("x")}.dmg",
      verified: "mirrors.ustc.edu.cn/julia-releases/bin/mac/"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  livecheck do
    url "https://julialang.org/downloads/manual-downloads/"
    regex(/\(LTS\)\s+release:\s+v?(\d+(?:\.\d+)+)/i)
  end

  auto_updates true
  conflicts_with cask: %w[
    julia-app
    julia-app@lts
  ]
  depends_on macos: ">= :ventura"

  app "Julia-#{version.major_minor}.app"
  binary "#{appdir}/Julia-#{version.major_minor}.app/Contents/Resources/julia/bin/julia", target: "julia-lts"

  zap trash: [
    "~/.julia",
    "~/Library/Logs/Julia",
    "~/Library/Preferences/com.github.Julia.plist",
    "~/Library/Preferences/julia.plist",
    "~/Library/Saved Application State/com.github.Julia.savedState",
  ]
end
