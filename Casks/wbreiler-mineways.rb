cask "wbreiler-mineways" do
  version "14.03"
  sha256 "d6d3fda4320da8df4a8331ce5cffdf0b1abf78b788454eba238631515dd99dc9"

  url "https://github.com/wbreiler/Mineways/releases/download/v#{version}/Mineways-macOS.zip"
  name "Mineways"
  desc "Export Minecraft worlds to 3D models"
  homepage "https://github.com/wbreiler/Mineways"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Mineways.app"

  caveats <<~EOS
    This native macOS fork is ad-hoc signed and is not notarized.
    macOS may block first launch. See the release's first-launch instructions:
      https://github.com/wbreiler/Mineways/releases/tag/v#{version}
  EOS
end
