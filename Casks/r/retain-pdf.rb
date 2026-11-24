cask "retain-pdf" do
  version "2026.11.23"
  sha256 "1869ff38f11ca0b74fa3b6db8708f6dd794864ec60b28bfc31380565070a9a07"

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
