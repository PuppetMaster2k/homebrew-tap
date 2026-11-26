# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.44.6"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.6/apeirogon-v0.44.6-aarch64-apple-darwin.tar.gz"
    sha256 "0e5722ee37ad02f8abd9cce3f8b55aced43d901299dd9c011cc376ab8210d3e6"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.6/apeirogon-v0.44.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0a04e3488b778e189a3ebb76ace49fb81de8fbf8bb89439ce453dd9ad63b8249"
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
