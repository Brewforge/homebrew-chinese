cask "gimp-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "3.0.0,1"
  sha256 arm:   "344d0b9aded2463cf8c49d62b582d5bdfbcee772eae40b908aeb4b01795e3b58",
         intel: "c4403d01af66c9cb141667f417c9dde27788ba4c4d27916bbb51ae7bbd123160"

  url "https://mirror.nju.edu.cn/gimp/gimp/v#{version.major_minor}/macos/gimp-#{version.csv.first}-#{arch}#{"-#{version.csv.second}" if version.csv.second}.dmg",
      verified: "mirror.nju.edu.cn/gimp/"
  name "GIMP development version"
  desc "Free and open-source image editor"
  homepage "https://www.gimp.org/"

  livecheck do
    url "https://www.gimp.org/gimp_versions.json"
    strategy :json do |json|
      json["STABLE"]&.map do |release|
        release["macos"]&.map do |build|
          next unless build["filename"]&.match?(/#{arch}/i)
          next release["version"] unless build["revision"]

          "#{release["version"]},#{build["revision"]}"
        end
      end&.flatten
    end
  end

  auto_updates true
  conflicts_with cask: ["gimp", "gimp-dev"]
  depends_on macos: ">= :high_sierra"

  app "GIMP.app"
  shimscript = "#{staged_path}/gimp.wrapper.sh"
  binary shimscript, target: "gimp"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      "#{appdir}/GIMP.app/Contents/MacOS/gimp" "$@"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/Gimp",
    "~/Library/Preferences/org.gimp.gimp-#{version.major_minor}:.plist",
    "~/Library/Saved Application State/org.gimp.gimp-#{version.major_minor}:.savedState",
  ]
end
