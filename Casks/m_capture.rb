cask "m_capture" do
  version "1.8.2"
  sha256 "2921a3b7ceee8eaaf8d846a5afbc2f73718fc975730fbb26014bb9431339d143"

  url "https://github.com/tuyen-nguyen-mesoneer/m_capture/releases/download/#{version}/m_capture.dmg"
  name "m_capture"
  desc "Menu-bar tool for screenshots and screen recording"
  homepage "https://github.com/tuyen-nguyen-mesoneer/m_capture"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself from GitHub Releases, so its version drifts from what
  # brew recorded at install time. Without this, `brew upgrade` reinstalls over a
  # newer self-updated build.
  auto_updates true
  depends_on macos: :sonoma

  # Installed into ~/Applications rather than the default /Applications: the app's
  # Relocator copies itself there on first launch anyway (Info.plist MCAutoInstall),
  # which would leave brew tracking a stale duplicate in /Applications. Living in the
  # user's own Applications folder is also what lets the in-app updater swap the
  # bundle without admin rights and keep the Screen Recording grant.
  app "m_capture.app", target: "#{Dir.home}/Applications/m_capture.app"

  # The app is signed with a self-signed identity, not notarized, so a quarantine
  # xattr would make Gatekeeper block the first launch — the manual `xattr -dr` step
  # this cask exists to remove.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{Dir.home}/Applications/m_capture.app"]
  end

  uninstall quit: "io.mesoneer.mcapture"

  zap trash: [
    "~/Library/Caches/io.mesoneer.mcapture",
    "~/Library/Preferences/io.mesoneer.mcapture.plist",
    "~/Library/Saved Application State/io.mesoneer.mcapture.savedState",
  ]
end
