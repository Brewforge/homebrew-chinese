cask "squirrel-ime" do
  version "0.16.2"
  sha256 "e08d28fd72445bccbdbccc06b16a9e300c07371f67d576cd4ed35731be9d4ad6"

  url "https://github.com/rime/squirrel/releases/download/#{version}/Squirrel-#{version}.zip"
  name "Squirrel"
  desc "Rime Input Method"
  homepage "https://github.com/rime/squirrel"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  pkg "Squirrel.pkg"

  zap trash: []
end
