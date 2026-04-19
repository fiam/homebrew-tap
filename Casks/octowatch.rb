cask "octowatch" do
  version "0.1.0"
  sha256 "646d33097de05323ad572a7aabe0f8d05451809561f1a5a9fd3be7a397a6aa25"

  url "https://github.com/fiam/octowatch/releases/download/v0.1.0/Octowatch-0.1.0.dmg",
      verified: "github.com/fiam/octowatch/"
  name "Octowatch"
  desc "Native macOS triage inbox for GitHub work"
  homepage "https://octowatch.app"

  auto_updates true

  app "Octowatch.app"

  zap trash: [
    "~/Library/Application Support/Octowatch",
    "~/Library/Caches/app.octowatch.macos",
    "~/Library/HTTPStorages/app.octowatch.macos",
    "~/Library/Preferences/app.octowatch.macos.plist",
    "~/Library/Saved Application State/app.octowatch.macos.savedState"
  ]
end
