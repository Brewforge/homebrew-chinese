cask "lceda-pro" do
  arch arm: "arm64", intel: "x64"

  version "2.1.59"
  sha256 arm:   "f8ecc9b8b396fca3988db5eccbc81a8e7260cae55f963074ef492bcc796a3935",
         intel: "2f7cd5e0dc6b55b1b676927eee53a2e9d0f21294be9d69a48135eecd7683dc84"

  url "https://image.lceda.cn/files/lceda-pro-mac-#{arch}-#{version}.zip"
  name "嘉立创EDA(专业版)"
  desc "高效的国产PCB设计工具，永久免费"
  homepage "https://lceda.cn/"

  auto_updates true


  app "嘉立创EDA(专业版).app"

  # zap trash: [
  # ]
end
