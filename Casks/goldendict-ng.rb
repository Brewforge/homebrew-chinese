cask "goldendict-ng" do
  version "6.5.1,20230623"
  sha256 "8cfe961c6bf79a6664e603739657880d73f8a0ff9babe004505e266be2d26e61"

  url "https://github.com/xiaoyifang/goldendict-ng/releases/download/tag-alpha.2a7d4d5e/#{version.csv.first}-GoldenDict_macos-12_homebrew_#{version.csv.second}.dmg"
  name "GoldenDict"
  desc "Next Generation GoldenDict"
  homepage "http://goldendict.org/"

  livecheck do
    url "https://github.com/xiaoyifang/goldendict-ng"
  end

  depends_on macos: ">= :sierra"

  app "GoldenDict.app"
  binary "#{appdir}/GoldenDict.app/Contents/MacOS/GoldenDict"

  zap trash: [
    "~/Library/Caches/GoldenDict-ng",
    "~/Library/Saved Application State/org.xiaoyifang.savedState",
    "~/.goldendict",
  ]
end
