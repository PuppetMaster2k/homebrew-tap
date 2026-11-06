# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.17.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.17.0/apeirogon-v0.17.0-aarch64-apple-darwin.tar.gz"
    sha256 "5192d4ec7ebf02d20b5eeda4506a347faaa43c3ae4d3fdc252b029b491c49fea"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.17.0/apeirogon-v0.17.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a8242d51ad5a66d08ee99b85c603059ea989eea47d3ed9b439ac8f5a242a65aa"
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
