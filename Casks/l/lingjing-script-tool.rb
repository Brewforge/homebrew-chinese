cask "lingjing-script-tool" do
  arch arm: "arm64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "ab77ec08810707166cbc21815dcec984e6682316e31d1dda873b154384b78551",
         intel: "2ea62e4ddd7f3615190b78eda7a6d57a90dcab51244546c86aaf4bf6b0cff514"

  url "https://github.com/lizheyong/lingjing-script-tool-releases/releases/download/v#{version}/Lingjing-Script-Tool-#{version}-#{arch}.dmg",
      verified: "github.com/lizheyong/lingjing-script-tool-releases/"
  name "Lingjing Script Tool"
  name "灵境剧本工具"
  desc "面向创作者的 AI 剧本工作台"
  homepage "https://github.com/lizheyong/lingjing-script-tool-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Lingjing Script Tool.app"
end
