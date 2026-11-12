# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.39.1"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.39.1/apeirogon-v0.39.1-aarch64-apple-darwin.tar.gz"
    sha256 "55f3f6c741e2e55531efb24c2b9a0c3ad3928bcba76f46c1b7ef090a62dc7b5c"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.39.1/apeirogon-v0.39.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "61a0595b932ba61a4b294c4affe3ee0b36b9a180de39bdf089cfc0c576a6df82"
  end

  def install
    bin.install "apeirogond", "a7n", "a7n-gui"
  end

  def caveats
    return unless OS.mac?

    <<~EOS
      Releases are unsigned. Grant Accessibility and Input Monitoring
      permissions again after every update.
    EOS
  end

  test do
    system "#{bin}/a7n", "--version"
  end
end
