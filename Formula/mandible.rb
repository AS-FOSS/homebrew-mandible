# typed: false
# frozen_string_literal: true

# Prebuilt-binary formula for mandible. Updated automatically by the
# release workflow in AS-FOSS/mandible; version and checksums below always
# describe one released tag's assets.
class Mandible < Formula
  desc "Universal, interactive TUI reference for CLI tools"
  homepage "https://github.com/AS-FOSS/mandible"
  version "0.8.4"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "fa21bd27f677d2fa31182489504252d6c0539e9d0ba068eb4fca2c2719b62be9"
    else
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "943582b5d3a8d9d7b4f43d873d8d53cb102da3bd19e6f9f90ff4a2aa4a8a3e21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "faae12b691ac8980cf4844b564ecc7c3306c13f4be881daa02a578a195e3bbe5"
    else
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3fc1cb03d8190c9ab34988e1e818ee4d16b7226b9da84a21b8be2f254396e5cf"
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
