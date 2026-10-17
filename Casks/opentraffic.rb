cask "opentraffic" do
  version "1.0.17"
  sha256 "a6527a05d8ef7e49ee12bdf1ab2681b0b990273902ff9bab9197c94b681c54a2"

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

  # OpenTraffic links its `opentraffic` command into your PATH when it starts; take that link away
  # with the app (only a link to an OpenTraffic.app, never a file of yours).
  uninstall_postflight do
    ["#{HOMEBREW_PREFIX}/bin/opentraffic", "/usr/local/bin/opentraffic", "#{Dir.home}/.local/bin/opentraffic"].uniq.each do |link|
      next unless File.symlink?(link) && File.readlink(link).end_with?(".app/Contents/Resources/opentraffic")

      File.delete(link)
    end
  end

  zap trash: [
    "~/Library/Application Support/OpenTraffic",
    "~/Library/Caches/se.medda.opentraffic",
    "~/Library/HTTPStorages/se.medda.opentraffic",
    "~/Library/Preferences/se.medda.opentraffic.plist",
  ]
end
