cask "argon" do
  version "0.3.0"
  sha256 "c22f5dcb162af4f8db79709a862cc2c4827e49548a39e077819ce170c59388d0"

  url "https://github.com/fiam/argon/releases/download/v0.3.0/Argon-0.3.0.dmg",
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
