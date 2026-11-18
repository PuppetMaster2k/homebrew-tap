# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.44.3"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.3/apeirogon-v0.44.3-aarch64-apple-darwin.tar.gz"
    sha256 "6148ac5480918f6118dd106b0a5857223681c9122ac9861235280f00a57b6ec6"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.3/apeirogon-v0.44.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "45e9346b53c2a32d1a86ad87b352c15ca16fb1ab718f239bcaf69fde3ebd42b3"
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
