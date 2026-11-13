# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.43.2"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.43.2/apeirogon-v0.43.2-aarch64-apple-darwin.tar.gz"
    sha256 "e781a059dc77913b791c179c643231d7249c52fbf8ca97e3a8da555d294db510"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.43.2/apeirogon-v0.43.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "62d3a7d8d6aa570f89fe303275b40918dfe8f6131b01a55a9f51712a7172d205"
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
