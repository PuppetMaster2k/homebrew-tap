# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.39.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.39.0/apeirogon-v0.39.0-aarch64-apple-darwin.tar.gz"
    sha256 "a9fc28e3125090d135a1ff6ad162f4b95ee613367d1a881353c6ebd10c78e0f7"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.39.0/apeirogon-v0.39.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "28cafc695123a6b61b22c0a99f737794c95e7e075e0c9635cf368cac30144597"
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
