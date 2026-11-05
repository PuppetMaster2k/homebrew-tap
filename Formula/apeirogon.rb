# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.15.7"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.15.7/apeirogon-v0.15.7-aarch64-apple-darwin.tar.gz"
    sha256 "293c1e587a39fc0f0bdd7973bf11e53f9421d2ec29a478221f649b6fd262f17e"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.15.7/apeirogon-v0.15.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4a71d463cf31759afd319ddac4a08215fe4487aadaa04f4352ec57a629e2d616"
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
