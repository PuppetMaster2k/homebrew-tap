# SPDX-License-Identifier: GPL-3.0-or-later
class Apeirogon < Formula
  desc "Share a keyboard, mouse and clipboard across machines"
  homepage "https://github.com/PuppetMaster2k/apeirogon"
  version "0.44.0"
  license "GPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.0/apeirogon-v0.44.0-aarch64-apple-darwin.tar.gz"
    sha256 "42e8c72398948d8f480603b894413ff8b87036235fd40b8cfadacb9efcaadf30"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/PuppetMaster2k/apeirogon/releases/download/v0.44.0/apeirogon-v0.44.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7496376b009a35da83ac4b9a4ff45af63366ebaf612389b6109b6476b55d1aa4"
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
