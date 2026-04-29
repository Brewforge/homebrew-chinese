cask "retain-pdf" do
  version "4.1.1-beta3"
  sha256 "6abe3702da2968cf325c3739d2be5cfeef812e3d3e209aa414e93d674237a768"

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

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "RetainPDF.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/RetainPDF.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.wxyhgk.retainpdf.sfl*",
    "~/Library/Preferences/com.wxyhgk.retainpdf.plist",
  ]
end
