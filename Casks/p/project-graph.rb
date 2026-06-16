cask "project-graph" do
  version "3.2.0"
  sha256 "77a04fcc49fbfcf1cff59859d174af3563a515e0b0ea4209678a7a634389ab6e"

  url "https://github.com/graphif/project-graph/releases/download/v#{version}/Project.Graph_#{version}_universal.app.tar.gz"
  name "Project Graph"
  desc "Next-generation node diagram tool for visual thinking"
  homepage "https://github.com/graphif/project-graph"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

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
