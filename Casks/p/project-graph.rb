cask "project-graph" do
  version "2.7.2"
  sha256 "b0981bc631f729c0658bf756f8fa9b21211858ccaa2696751a85a74a3cc19e2b"

  url "https://github.com/graphif/project-graph/releases/download/v#{version}/Project.Graph_#{version}_universal.app.tar.gz"
  name "Project Graph"
  desc "Next-generation node diagram tool for visual thinking"
  homepage "https://github.com/graphif/project-graph"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Project Graph.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Project Graph.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/liren.project-graph",
    "~/Library/Caches/liren.project-graph",
    "~/Library/Preferences/liren.project-graph.plist",
    "~/Library/Saved Application State/liren.project-graph.savedState",
  ]
end
