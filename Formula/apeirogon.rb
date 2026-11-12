# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.37.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.37.0/apeirogon-v0.37.0-aarch64-apple-darwin.tar.gz"
    sha256 "baef3a911e50913b9868021a99eacef70a4a7433e7ecabefcfc5a8999b1a2e40"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.37.0/apeirogon-v0.37.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6cb60c5de539aacd4850469afa3e4716a8d727c2514461ada23c5e568e5d3c1e"
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
