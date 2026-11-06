# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.19.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.19.0/apeirogon-v0.19.0-aarch64-apple-darwin.tar.gz"
    sha256 "ca7adc51c7d0dbf53e726a81c4c116016d68d69f281848882eaeebb1a91c81b7"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.19.0/apeirogon-v0.19.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a56c80ad6a79f52070f474134c137dee4d0704cd8c2f5bb9a883d2a6f7e9a481"
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
