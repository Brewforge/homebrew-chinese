cask "retain-pdf" do
  version "4.2.5"
  sha256 "7932fcb367c52dc89ea0b8acdd3ef2f8a7ff639843a90dea4abdaed5be72a111"

  url "https://github.com/wxyhgk/retain-pdf/releases/download/v#{version}/RetainPDF-Mac-#{version}.dmg"
  name "retain-pdf"
  desc "在保留版面、公式与结构的前提下进行 PDF 翻译"
  homepage "https://github.com/wxyhgk/retain-pdf"

  livecheck do
    url "https://github.com/wxyhgk/retain-pdf/releases"
    regex(/RetainPDF-Mac-(\d+(\.\d+){2})(-beta\d)?\.dmg/i)
    strategy :github_latest do |json, regex|
      json["assets"]&.map do |asset|
        match = asset["browser_download_url"]&.match(regex)
        next if match.blank?

        "#{match[1]}#{match[3]}"
      end
    end
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "RetainPDF.app"

  preflight_steps do
    run "xattr", args: ["-cr", "{{staged_path}}/RetainPDF.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.wxyhgk.retainpdf.sfl*",
    "~/Library/Preferences/com.wxyhgk.retainpdf.plist",
  ]
end
