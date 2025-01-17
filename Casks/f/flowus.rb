require "net/http"
require "uri"

cask "flowus" do
  arch arm: "arm64", intel: "x64"

  version "120"
  sha256 arm:   "358af712f5aaffea5b5141e75860e18b57bd6139088a1f5f565d73287777971d",
         intel: "48a38173a7181bd24f647d162488284a94e5cbf8678b15de8bbe41d5dbad4bd4"

  url "https://desktopdownload2.flowus.cn/production/mac/flowus-mac-#{arch}.zip",
      user_agent: :fake,
      header: [
        "Referer: https://flowus.cn/"
      ]
  name "flowus"
  desc "类 Notion 和飞书的笔记协作软件"
  homepage "https://flowus.cn/"

  livecheck do
    url "https://flowus.cn/download"
    strategy :page_match do |page|
      page.scan(%r{download-([0-9a-f]+)\.js}).map do |match|
        uri = URI("https://cdn2.flowus.cn/assets/_next/static/chunks/pages/download-#{match[0]}.js")
        res = Net::HTTP.get_response(uri)

        next unless res.is_a?(Net::HTTPSuccess)

        res.body.match(/macVersion:"([^"]+)"/)[1]
      end
    end
  end

  auto_updates true

  app "flowus.app"

  zap trash: [
    "/Applications/flowus.app",
    "~/Library/Application Support/FlowUs",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.flowus.app.sfl3",
    "~/Library/Preferences/com.flowus.app.plist",
    "~/Library/Saved Application State/com.flowus.app.savedState"
  ]
end
