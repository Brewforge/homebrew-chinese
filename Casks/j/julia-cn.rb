cask "julia-cn" do
  arch arm: "aarch64", intel: "x64"

  version "1.12.5"
  sha256 arm:   "356deef6cca2a882cb7ae15ecdfbac5ae32d835c12d0f8e17d45aaf4d30e21b1",
         intel: "bcd78fb4d22881384152816e2e87a16f259739816c8b5fb99d667ce5f3fdc04d"

  url "https://mirrors.ustc.edu.cn/julia-releases/bin/mac/#{arch}/#{version.major_minor}/julia-#{version}-mac#{arch.delete_prefix("x")}.dmg",
      verified: "mirrors.ustc.edu.cn/julia-releases/bin/mac/"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  livecheck do
    url "https://julialang.org/downloads/manual-downloads/"
    regex(/Current stable release:\s+v?(\d+(?:\.\d+)+)/i)
  end

  auto_updates true
  conflicts_with cask: "julia-app"
  depends_on macos: ">= :sequoia"

  app "Julia-#{version.major_minor}.app"
  binary "#{appdir}/Julia-#{version.major_minor}.app/Contents/Resources/julia/bin/julia"

  zap trash: [
    "~/.julia",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.github.julia.sfl*",
    "~/Library/Logs/Julia",
    "~/Library/Preferences/com.github.Julia.plist",
    "~/Library/Preferences/julia.plist",
    "~/Library/Saved Application State/com.github.Julia.savedState",
  ]
end
