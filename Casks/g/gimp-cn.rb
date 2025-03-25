cask "gimp-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "3.0.2"
  sha256 arm:   "847e1d57e937ffd23c3b3a8c0a1ce50e04b1706b75e0184d6f6f6b3f941be9d3",
         intel: "4d35487502c4947e037f30871ff509b16fa361936acd2a2ed00e1d99821da226"

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
