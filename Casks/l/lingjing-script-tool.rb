cask "lingjing-script-tool" do
  arch arm: "arm64", intel: "x64"

  version "0.2.8"
  sha256 arm:   "c931f08fc821673d3a6e0a3d1d841439501809ad0f2837ecc0c08888eefa16fb",
         intel: "d474fbfbf00959c3a851b7b0956a556d93cc708dbb23c0307bb9c4a278e6d131"

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
