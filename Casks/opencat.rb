cask "opencat" do
  version "2.0.1.410"
  sha256 "9a5010912a4bc8ca8c958e945660b890784e82b57e05c618521a92fef20a990f"

  url "https://opencat.app/releases/OpenCat-#{version}.dmg"
  name "OpenCat"
  desc "OpenAI/Azure OpenAI/Claude/Gemini Pro API 第三方图形化客户端（比应用商店版多 键盘扩展 功能）"
  homepage "https://opencat.app/"

  auto_updates true
  app "OpenCat.app"

  livecheck do
    url :homepage
    regex(/OpenCat[._-]v?(\d+(?:\.\d+)+)/i)
  end

  zap trash: [
    "~/Library/Preferences/tech.baye.OpenCat.plist",
    "~/Library/Containers/tech.baye.OpenCat",
    "~/Library/Group Containers/group.tech.baye.openai",
    "~/Library/Saved Application State/tech.baye.OpenCat.savedState",
    "~/Library/HTTPStorages/tech.baye.OpenCat",
    "~/Library/Application Support/OpenCat",
    "~/Library/Application Scripts/group.tech.baye.openai",
    "~/Library/Application Scripts/tech.baye.OpenCat",
    "~/Library/Application Support/tech.baye.OpenCat",
  ]
end
