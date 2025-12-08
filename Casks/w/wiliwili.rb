cask "wiliwili" do
  arch arm: "AppleSilicon", intel: "IntelChip"

  version "1.5.3"
  sha256 arm:   "67665e626ae3b050169c2fa7dd1c5105c310eeab7819c4415be52c49db1c74f8",
         intel: "07409c601988ba8433ec53f359101057dda3ae6a3acc6f6101aab9f767427474"

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
