cask "wiliwili" do
  arch arm: "AppleSilicon", intel: "IntelChip"

  version "1.6.0"
  sha256 arm:   "5399c68594bbd2a5b9987b49fb266cf0d2b298dcabc3666a66f272c94fdca964",
         intel: "79813a05d667eefe847bcb1cc544f110d5776a6f021f47170a4ec142ebb04c74"

  url "https://github.com/xfangfang/wiliwili/releases/download/v#{version}/wiliwili-macOS-#{arch}.dmg",
      verified: "github.com/xfangfang/wiliwili/"
  name "wiliwili"
  desc "一个专为手柄用户设计的第三方 B 站 客户端"
  homepage "https://xfangfang.github.io/wiliwili/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "wiliwili.app"

  zap trash: "~/Library/Application Support/wiliwili"
end
