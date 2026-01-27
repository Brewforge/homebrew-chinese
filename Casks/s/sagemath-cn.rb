cask "sagemath-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "10.8,2.8.4"
  sha256 arm:   "0122d24622f86ef885865aa31c809c4663ce1b8d0868ae456ffaf0baaefad2c2",
         intel: "9b4e0803dd933471e4b35997f1419f52efa8a201b0fe6b3e84a322f3f30727c7"

  url "https://mirrors.ustc.edu.cn/github-release/3-manifolds/Sage_macOS/LatestRelease/SageMath-#{version.csv.first}_#{arch}.dmg",
      verified: "mirrors.ustc.edu.cn/github-release/3-manifolds/Sage_macOS/LatestRelease/"
  name "Sage"
  desc "Mathematics software system"
  homepage "https://www.sagemath.org/"

  livecheck do
    url "https://github.com/3-manifolds/Sage_macOS/"
    regex(%r{/v?(\d+(?:\.\d+)+)/SageMath[._-]v?(\d+(?:\.\d+)+)[._-].*?#{arch}\.dmg$}i)
    strategy :github_latest do |json, regex|
      json["assets"]&.map do |asset|
        match = asset["browser_download_url"]&.match(regex)
        next if match.blank?

        "#{match[2]},#{match[1]}"
      end
    end
  end

  depends_on macos: ">= :big_sur"

  app "SageMath-#{version.csv.first.dots_to_hyphens}.app"
  pkg "Recommended_#{version.csv.first.dots_to_underscores}.pkg"

  uninstall quit:    [
              "com.tcltk.tcllibrary",
              "com.tcltk.tklibrary",
              "org.computop.sage",
              "org.computop.SageMath",
            ],
            pkgutil: [
              "org.computop.SageMath.#{version.csv.first.dots_to_underscores}.bin",
              "org.computop.SageMath.#{version.csv.first.dots_to_underscores}.share",
              "org.computop.SageMath.#{version.csv.first.dots_to_underscores}.texlive",
            ]

  zap trash: [
    "~/.sage",
    "~/Library/Application Support/SageMath",
    "~/Library/Preferences/SageMath.plist",
  ]
end
