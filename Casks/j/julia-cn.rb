cask "julia-cn" do
  arch arm: "aarch64", intel: "x64"
  livecheck_arch = on_arch_conditional arm: "aarch64", intel: "x86_64"

  version "1.12.3"
  sha256 arm:   "49b624570de64a98420d1e0950060b0ea3a505662abe80fe3fcc989cee773b9c",
         intel: "a2d6f81bbf3253ff67e4004cfd34294d1a9d0d9298ef9f1aff6ac1321fa2ae37"

  url "https://mirrors.ustc.edu.cn/julia-releases/bin/mac/aarch64/#{version.major_minor}/julia-#{version}-mac#{arch.delete_prefix("x")}.dmg",
      verified: "mirrors.ustc.edu.cn/julia-releases/bin/mac/"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  livecheck do
    url "https://julialang-s3.julialang.org/bin/versions.json"
    strategy :json do |json|
      json.map do |version, release|
        next unless release["stable"]
        next unless release["files"].any? { |file| file["os"] == "mac" && file["arch"] == livecheck_arch }

        version
      end
    end
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
