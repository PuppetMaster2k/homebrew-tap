# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.41.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.41.0/apeirogon-v0.41.0-aarch64-apple-darwin.tar.gz"
    sha256 "3ced0572c97a7cf343a710baf3f78d5019618bd952a32759e0b09c57071384dd"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.41.0/apeirogon-v0.41.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9c3b1aa0fcc1a223023b24b063b02f019c0e554279fe8f042ece497ea1ee3949"
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
