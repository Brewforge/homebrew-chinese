cask "chatgpt" do
  version "1.1.0"
  sha256 "f870ba135ad990715474cbb038b5b38acb8d08640803e2c79c878e210f4800f6"

  url "https://github.com/lencx/ChatGPT/releases/download/v#{version}/ChatGPT_#{version}_macos_aarch64.dmg"
  name "ChatGPT"
  desc "Desktop wrapper for OpenAI ChatGPT"
  homepage "https://github.com/lencx/ChatGPT"

  app "ChatGPT.app"

  uninstall quit: "com.lencx.chatgpt"

  zap trash: [
    "~/.chatgpt",
    "~/Library/Caches/com.lencx.chatgpt",
    "~/Library/HTTPStorages/com.lencx.chatgpt.binarycookies",
    "~/Library/Preferences/com.lencx.chatgpt.plist",
    "~/Library/Saved Application State/com.lencx.chatgpt.savedState",
    "~/Library/WebKit/com.lencx.chatgpt",
  ]
end
