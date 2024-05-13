cask "squirrel-ime" do
  version "0.18"
  sha256 "467e23babbd1b0c74887a45b299e750aa4398f069f77345b00f436b68c310a3a"

  mirror = "https://mirror.ghproxy.com/"
  origin = "https://github.com/rime/squirrel/releases/download/#{version}/Squirrel-#{version}.zip"

  url "#{mirror}#{origin}",
      verified: "mirror.ghproxy.com/"
  name "Squirrel"
  desc "Rime Input Method"
  homepage "https://github.com/rime/squirrel"

  livecheck do
    url origin.to_s
    strategy :github_latest
  end

  auto_updates true

  pkg "Squirrel.pkg"

  uninstall quit:    "com.rime.Squirrel",
            pkgutil: "com.rime.Squirrel"

  zap trash: []
end
