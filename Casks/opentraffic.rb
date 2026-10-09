cask "opentraffic" do
  version "1.0.3"
  sha256 "5f931d3aafc8c9e50f6e6a095e2d476347c9881dce64a8a7a395f49472631377"

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
