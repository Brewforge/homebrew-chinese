cask "flowus" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "358af712f5aaffea5b5141e75860e18b57bd6139088a1f5f565d73287777971d",
         intel: "48a38173a7181bd24f647d162488284a94e5cbf8678b15de8bbe41d5dbad4bd4"

  url "https://desktopdownload2.flowus.cn/production/mac/flowus-mac-#{arch}.zip",
      user_agent: :fake,
      header:     [
        "Referer: https://flowus.cn/",
        "CLIENT-IP: 115.239.211.92", # 杭州 IP
        "X-Forwarded-For: 115.239.211.92", # 杭州 IP
      ]
  name "flowus"
  desc "类 Notion 和飞书的笔记协作软件"
  homepage "https://flowus.cn/"

  livecheck do
    url "https://flowus.cn/download"
    # strategy :page_match do |page|
    #   require "net/http"
    #   require "uri"

    #   page.scan(/download-([0-9a-f]+)\.js/).map do |match|
    #     uri = URI("https://cdn2.flowus.cn/assets/_next/static/chunks/pages/download-#{match[0]}.js")
    #     res = Net::HTTP.get_response(uri)

    #     next unless res.is_a?(Net::HTTPSuccess)

    #     res.body.match(/macVersion:"([^"]+)"/)[1]
    #   end
    # end
    skip "无 header，无法通过 PR"
  end

  auto_updates true

  app "flowus.app"

  zap trash: [
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.flowus.app",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.flowus.app.helper.GPU",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.flowus.app.sfl*",
    "~/Library/Application Support/FlowUs",
    "~/Library/Preferences/com.flowus.app.plist",
    "~/Library/Saved Application State/com.flowus.app.savedState",
  ]
end
