# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.44.2"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.2/apeirogon-v0.44.2-aarch64-apple-darwin.tar.gz"
    sha256 "6cacb3e535aa606f1c4a0a274e0f2242eac9434a5ccf7a0e1bbec71f8d3dd434"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.2/apeirogon-v0.44.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cf0447e0dbcc92d59ebb13cc0d0b14037a982f8f6b3578af7dc0dbd2182a90b5"
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
