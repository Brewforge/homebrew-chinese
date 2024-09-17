cask "copybook" do
  version "1.0.1102"
  sha256 "0be7be40aa1010b40ba7554566d68be902bb2ac70bd60180fcdc257d7798f16a"

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
      json.filter_map do |release|
        matched = release["assets"].filter_map do |asset|
          match = asset["name"].match(regex)
          next if match.blank?

          match[1]
        end.first

        next if matched.blank?

        matched
      end.first
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
