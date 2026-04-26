cask "argon" do
  version "0.1.0"
  sha256 "7795648ea472a61b02f7cf6beb2de8ddac3c8b2137a09d5630f407f42e97e044"

  url "https://github.com/fiam/argon/releases/download/v0.1.0/Argon-0.1.0.dmg",
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
