# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.15.1"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.15.1/apeirogon-v0.15.1-aarch64-apple-darwin.tar.gz"
    sha256 "ba28ff66835b90eca2494d8504f6d5ba58e5b8b879924e888c46b727ccacb581"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.15.1/apeirogon-v0.15.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "72f7974eba57225cbdf617316478a5434453fea4b779f3b82bd815d60b643c3a"
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
