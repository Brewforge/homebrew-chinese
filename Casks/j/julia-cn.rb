cask "julia-cn" do
  arch arm: "aarch64", intel: "x64"

  version "1.12.4"
  sha256 arm:   "69df6d591592bf44af434be77d514d252aa315c89b312e8b5251a6a3313827a8",
         intel: "47058f83ed84868ea83c1b716a88331a8b2f3e1414c4b04602761eb8ab627790"

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
