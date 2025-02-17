cask "flowus" do
  arch arm: "arm64", intel: "x64"

  version "1.2.0"
  sha256 :no_check

  url "https://desktopdownload2.flowus.cn/production/mac/flowus-mac-#{arch}.zip",
      user_agent: :fake,
      referer:    "https://flowus.cn/",
      header:     [
        "CLIENT-IP: 115.239.211.92", # 杭州 IP
        "X-Forwarded-For: 115.239.211.92", # 杭州 IP
      ]
  name "flowus"
  desc "类 Notion 和飞书的笔记协作软件"
  homepage "https://flowus.cn/"

  livecheck do
    url "https://flowus.cn/download"
    strategy :page_match do |page|
      require "net/http"
      require "uri"

      page.scan(/download-([0-9a-f]+)\.js/).map do |match|
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
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.flowus.app",
    "/var/folders/py/n14256yd5r5ddms88x9bvsv40000gn/C/com.flowus.app.helper.GPU",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.flowus.app.sfl*",
    "~/Library/Application Support/FlowUs",
    "~/Library/Preferences/com.flowus.app.plist",
    "~/Library/Saved Application State/com.flowus.app.savedState",
  ]
end
