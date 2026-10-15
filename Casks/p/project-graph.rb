cask "project-graph" do
  version "4.2.5"
  sha256 "e87627128c32ca8aba9b7c7843e7a79c301b5f911a982de9d4db872be844524c"

  url "https://github.com/graphif/project-graph/releases/download/v#{version}/Project.Graph_#{version}_universal.app.tar.gz"
  name "Project Graph"
  desc "Next-generation node diagram tool for visual thinking"
  homepage "https://github.com/graphif/project-graph"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Project Graph.app"

  postflight_steps do
    run "xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Project Graph.app"]
  end

  zap trash: [
    "~/Library/Application Support/liren.project-graph",
    "~/Library/Caches/liren.project-graph",
    "~/Library/Preferences/liren.project-graph.plist",
    "~/Library/Saved Application State/liren.project-graph.savedState",
  ]
end
