# typed: false
# frozen_string_literal: true

# Prebuilt-binary formula for mandible. Updated automatically by the
# release workflow in AS-FOSS/mandible; version and checksums below always
# describe one released tag's assets.
class Mandible < Formula
  desc "Universal, interactive TUI reference for CLI tools"
  homepage "https://github.com/AS-FOSS/mandible"
  version "0.8.0"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "27da3523e3eb072822ab7baea4f5a678e8728f75705e6d942dd391eaa82c0ea0"
    else
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2c433feadc5faa8d2109cf4a238c6879626c4cddcaa2bdd8c0c907f64dae0dcb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01de40409521a541b426427fd5283c9449678c086c4b611a16e9f88de57064aa"
    else
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ad60aff2e20e9d4101e6a91e7057045619338c273a0f08cbb0497c1a740de4c"
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
