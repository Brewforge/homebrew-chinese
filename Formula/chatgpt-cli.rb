class ChatgptCli < Formula
  desc "Simple cli wrapper for ChatGPT API, powered by GPT-3.5-turbo model"
  homepage "https://github.com/j178/chatgpt"
  version "1.2.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/j178/chatgpt/releases/download/v#{version}/chatgpt_Darwin_arm64.tar.gz"
      sha256 "265549694c199faf5f979f6251502f0acba47b3426608c40346647d3c281edb9"
    else
      url "https://github.com/j178/chatgpt/releases/download/v#{version}/chatgpt_Darwin_x86_64.tar.gz"
      sha256 "629cfec1dd7841b2d59566634fd257da07978bea482cfaab462cde2778309a1f"
    end
  else
    if Hardware::CPU.arm?
      url "https://github.com/j178/chatgpt/releases/download/v#{version}/chatgpt_Linux_arm64.tar.gz"
      sha256 "4ce0ad0d9e52830bbad16a508c68b1549d20a56d9b92dad3f4277e80019c1dc4"
    else
      url "https://github.com/j178/chatgpt/releases/download/v#{version}/chatgpt_Linux_x86_64.tar.gz"
      sha256 "ba3b752af82ed0cf1ef93e3e6337453df2cb4699b5ee3883c56226923d970d2a"
    end
  end

  livecheck do
    url :homepage
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    bin.install "chatgpt"
  end
end
