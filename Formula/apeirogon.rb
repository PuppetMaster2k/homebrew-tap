# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.27.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.27.0/apeirogon-v0.27.0-aarch64-apple-darwin.tar.gz"
    sha256 "dd2307e12c134ae3e36572cfbf86cb94aaa57bac177625c8475b2da72725b1c8"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.27.0/apeirogon-v0.27.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "248f54c60e3b38506e968342dca17c2e204662da91a5ec3bcc59cc8b987ef8d9"
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
