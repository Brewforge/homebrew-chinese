cask "wiliwili" do
  arch arm: "AppleSilicon", intel: "IntelChip"

  version "1.5.2"
  sha256 arm:   "99ec5b23a61cc03ffecf183533d7e5791e3d9db85c85dcdd3de1fdc942f2daaa",
         intel: "dfd03849b1220de46b0179368a5e0ce7c00939c7b4643f1a2d1e3ce8a37ee6cd"

  url "https://github.com/xfangfang/wiliwili/releases/download/v#{version}/wiliwili-macOS-#{arch}.dmg",
      verified: "github.com/xfangfang/wiliwili/"
  name "wiliwili"
  desc "一个专为手柄用户设计的第三方 B站 客户端"
  homepage "https://xfangfang.github.io/wiliwili/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "wiliwili.app"

  zap trash: "~/Library/Application Support/wiliwili"
end
