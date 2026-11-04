# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.15.3"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.15.3/apeirogon-v0.15.3-aarch64-apple-darwin.tar.gz"
    sha256 "ef44569a08d9900a8f0aa48443920beeb016261562d8212130677b3638649c93"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.15.3/apeirogon-v0.15.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "668bb52d8503bd29714d4ef974954a32f09ba99561430873a9463c237d20e7c2"
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
