# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.21.1"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.21.1/apeirogon-v0.21.1-aarch64-apple-darwin.tar.gz"
    sha256 "5073b8ba50378f8e5331178d44e040a2018675ae65b063876927fe00a960ee10"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.21.1/apeirogon-v0.21.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "172b319a0cdc1c85be06b62929a05210a62cd2f8f324343dee1dc3aac404a772"
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
