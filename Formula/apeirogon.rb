# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.42.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.42.0/apeirogon-v0.42.0-aarch64-apple-darwin.tar.gz"
    sha256 "20c08af9beec617103328d63cddf6e28b74bb9aee2a701a99aef8c5cee53fabd"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.42.0/apeirogon-v0.42.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "90ff45ae86ae8bed217ac8df3d9f6d5b8d84c7f379f606849d8ff6e7a10b3b15"
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
