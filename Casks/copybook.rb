cask "copybook" do
  version "1.0.1096"
  sha256 "08effb5bdcd1df72b6c246beddd7c308476ebb0016a50c3f1e0f87eb24272987"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/xxNull-lsk/Copybook/releases/download/v#{version}/copybook_#{version}_macos_x64.tar.gz"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "Copybook"
  desc "生成拼音、汉字、汉字字帖，支持笔顺"
  homepage "https://github.com/xxNull-lsk/Copybook/"

  livecheck do
    url origin.to_s
    regex(/copybook_([^_]+)_macos_x64.tar.gz/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        matched = release['assets'].map do |asset|
          match = asset['name'].match(regex)
          next if match.blank?
          match[1]
        end.compact.first

        next if matched.blank?

        matched
      end.compact.first
    end
  end

  app "字帖生成器.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/字帖生成器.app"]
  end

  zap trash: [
    "~/Library/Application Scripts/top.mydata.copybook",
    "~/Library/Containers/top.mydata.copybook",
  ]

  # caveats do
  #   requires_rosetta
  # end
end
