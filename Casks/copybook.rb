cask "copybook" do
  version "1.0.1096"
  sha256 "08effb5bdcd1df72b6c246beddd7c308476ebb0016a50c3f1e0f87eb24272987"

  url "https://github.com/xxNull-lsk/Copybook/releases/download/v#{version}/copybook_#{version}_macos_x64.tar.gz"
  name "Copybook"
  desc "生成拼音、汉字、汉字字帖，支持笔顺"
  homepage "https://github.com/xxNull-lsk/Copybook/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "字帖生成器.app"

  zap trash: [
    "~/Library/Application Scripts/top.mydata.copybook"
  ]
end
