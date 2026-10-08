cask "opentraffic" do
  version "1.0.2"
  sha256 "9614cd4800d79dbc9068b1e67b4836c3335ae6c90829b77f8d769b7d16e275c3"

  url "https://github.com/Medda-systems/OpenTraffic-releases/releases/download/v#{version}/OpenTraffic-#{version}.dmg"
  name "OpenTraffic"
  desc "Share local dev servers through Cloudflare, Tailscale, ngrok, or OpenTunnel"
  homepage "https://github.com/Medda-systems/OpenTraffic-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "OpenTraffic.app"

  zap trash: [
    "~/Library/Application Support/OpenTraffic",
    "~/Library/Caches/se.medda.opentraffic",
    "~/Library/HTTPStorages/se.medda.opentraffic",
    "~/Library/Preferences/se.medda.opentraffic.plist",
  ]

  caveats <<~EOS
    OpenTraffic isn't notarized yet. The first time you open it, macOS blocks it:
    open System Settings → Privacy & Security and click "Open Anyway".
  EOS
end
