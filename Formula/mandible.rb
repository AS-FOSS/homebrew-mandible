# typed: false
# frozen_string_literal: true

# Prebuilt-binary formula for mandible. Updated automatically by the
# release workflow in AS-FOSS/mandible; version and checksums below always
# describe one released tag's assets.
class Mandible < Formula
  desc "Universal, interactive TUI reference for CLI tools"
  homepage "https://github.com/AS-FOSS/mandible"
  version "0.8.3"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2a9697868d335600ba4d3e851379955a84d656555922d5aef6435dc8b42ff26c"
    else
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "026e67bffe6cde622aa5dcb7500f17742103bd5f06e8ade84fe8be30fe1402b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2d1852500207af304957225810f621fc64b4005fdb2a15d225a44fcd73c41e9"
    else
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "152ed678fa09882e6fadec35e34e589934d9c633b29ab1635ae189fad9d09ecd"
    end
  end

  def install
    bin.install "mandible"
    man1.install "mandible.1"
    generate_completions_from_executable(bin/"mandible", "--completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mandible --version")
  end
end
