cask "octowatch" do
  version "0.2.0"
  sha256 "a2d410609547215c481e3c64aeabddfedc66c120019230128aa2552dd1eea48b"

  url "https://github.com/fiam/octowatch/releases/download/v0.2.0/Octowatch-0.2.0.dmg",
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
