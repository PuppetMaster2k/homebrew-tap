# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.26.2"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.26.2/apeirogon-v0.26.2-aarch64-apple-darwin.tar.gz"
    sha256 "ea9f0bd42bda5dc48bc4bb73f7adbecc101f79ef97ab60395b4922e496ded5d5"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.26.2/apeirogon-v0.26.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7863eba566daa328ed342362ffa0346a776626a44ae1f33454ada38a034760af"
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
