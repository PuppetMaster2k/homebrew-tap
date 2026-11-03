# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.8.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.8.0/apeirogon-v0.8.0-aarch64-apple-darwin.tar.gz"
    sha256 "55b816f5f6677b16f8c5748fab31a54d8cf93b087fd4a08820f17fedc36b7944"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.8.0/apeirogon-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "df01fdbedf02f16ce523cb5123ffbd6820f94077a0fa024e13f0c87f2ff0210f"
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
