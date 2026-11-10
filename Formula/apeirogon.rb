# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.26.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.26.0/apeirogon-v0.26.0-aarch64-apple-darwin.tar.gz"
    sha256 "e65386e4393f33b8a7d5752cec214127d687aae9322102756359dc24241455f3"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.26.0/apeirogon-v0.26.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "615b7286ca248a58f764107fbfb0137fec97e8942ee761a0a9fb13304fe14aa4"
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
