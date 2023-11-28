class Docsetutil < Formula
  desc "Apple developer tool for working with .docset bundles"
  homepage "https://github.com/SwiftDocOrg/DocSetUtil"
  url "https://github.com/SwiftDocOrg/DocSetUtil.git", tag: "1.0.0", revision: "a145f7b3cf6e5244c8add4c5c64cd1252cd2855f"
  head "https://github.com/SwiftDocOrg/DocSetUtil.git", shallow: false

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "#{bin}/docsetutil"
  end
end
