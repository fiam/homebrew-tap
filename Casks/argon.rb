cask "argon" do
  version "0.2.0"
  sha256 "407a6b354e97258c7ac680a58b2f9839d4efb90501abc720ebdb585fa6e33511"

  url "https://github.com/fiam/argon/releases/download/v0.2.0/Argon-0.2.0.dmg",
      verified: "github.com/fiam/argon/"
  name "Argon"
  desc "Native macOS workspace for coding agents"
  homepage "https://argonapp.dev"

  auto_updates true

  app "Argon.app"

  zap trash: [
    "~/Library/Application Support/Argon",
    "~/Library/Caches/dev.argonapp.macos",
    "~/Library/HTTPStorages/dev.argonapp.macos",
    "~/Library/Preferences/dev.argonapp.macos.plist",
    "~/Library/Saved Application State/dev.argonapp.macos.savedState"
  ]
end
