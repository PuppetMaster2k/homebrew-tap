# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.11.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.11.0/apeirogon-v0.11.0-aarch64-apple-darwin.tar.gz"
    sha256 "e9fa3184e4f3ce6a6c14cdb625306277e82e33a5fe87aa2ac66a8359350e79ae"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.11.0/apeirogon-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e3775f508a040ae98022c018b8526e23348b58fec538f3fff1b7c09381356a68"
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
