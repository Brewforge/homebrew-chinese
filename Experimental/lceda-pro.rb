cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "2.1.32"
  sha256 arm:   "a141567b96e9a104b27263652d693391d48cd2ac5dd8f1cc83a277e7cc930c44",
         intel: "5b6fda59019a143068ae8f063dcb75922d521a0c7fb591d798107eda7ad65951"

  url "https://image.lceda.cn/files/lceda-pro-mac-#{arch}-#{version}.zip"
  name "嘉立创EDA(专业版)"
  desc "高效的国产PCB设计工具，永久免费"
  homepage "https://lceda.cn/"

  auto_updates true
  app "嘉立创EDA(专业版).app"

  # zap trash: [
  # ]
end
