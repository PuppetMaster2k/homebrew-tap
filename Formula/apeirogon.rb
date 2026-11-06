# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.18.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.18.0/apeirogon-v0.18.0-aarch64-apple-darwin.tar.gz"
    sha256 "a9d6c77d1e6599a1dab10b14cd699920194f189d76e26238a9f1e8c305030981"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.18.0/apeirogon-v0.18.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9e56e0ba5d306dd436d8402731b75dca7f2b783659768c85175633b2e43446fc"
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
