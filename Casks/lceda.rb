cask "lceda" do
  version "6.5.36"
  sha256 "3a8e8191421290e75382a50b2a55c6fbb3aae6a1dcf2aec9f052370c4d3fea25"

  url "https://image.lceda.cn/files/lceda-mac-x64-#{version}.zip"
  name "嘉立创EDA"
  desc "高效的国产PCB设计工具，永久免费"
  homepage "https://lceda.cn/"

  auto_updates true

  app "嘉立创EDA.app"

  # zap trash: [
  # ]
end
