# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.12.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.12.0/apeirogon-v0.12.0-aarch64-apple-darwin.tar.gz"
    sha256 "a8ba73ea2f8466f25a911839f31eeafb61b0a594b0e4ea767a314237a1e2ad0c"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.12.0/apeirogon-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "461ef246b6090d41ec6ed535bbea6c8f8b3cc487e59db5ce860ba91a7023a772"
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
