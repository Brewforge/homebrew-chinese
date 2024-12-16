cask "flowus" do
  arch arm: "arm64", intel: "x64"

  version "120"
  sha256 arm:   "358af712f5aaffea5b5141e75860e18b57bd6139088a1f5f565d73287777971d",
         intel: "48a38173a7181bd24f647d162488284a94e5cbf8678b15de8bbe41d5dbad4bd4"

  url "https://desktopdownload2.flowus.cn/production/mac/flowus-mac-#{arch}.zip",
      user_agent: :fake
  name "flowus"
  desc "类 Notion 和飞书的笔记协作软件"
  homepage "https://flowus.cn/"

  livecheck do
    url "https://flowus.cn/download"
    regex(/"(\d{2,3})"/i)
  end

  auto_updates true

  app "flowus.app"

  # zap trash: [
  # ]
end
