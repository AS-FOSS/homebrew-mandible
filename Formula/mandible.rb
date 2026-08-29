# typed: false
# frozen_string_literal: true

# Prebuilt-binary formula for mandible. Updated automatically by the
# release workflow in AS-FOSS/mandible; version and checksums below always
# describe one released tag's assets.
class Mandible < Formula
  desc "Universal, interactive TUI reference for CLI tools"
  homepage "https://github.com/AS-FOSS/mandible"
  version "0.4.5"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9acb3dfacf31f05ff780697543b5921fcf49dcdb2f5d3533af05cf8660fed013"
    else
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b09810f2562a7ff3a4f57fd222caaf9647e4573a1adf6f8e1354fb82536753ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7fd37fa261165d450d8f61ba1c784bf906e0cabf79ee19864917aab5d53d8083"
    else
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6340d2de9e06c810aa83bd8d034c1a970aa75ac0cb4a29b9e4ac9fec292a15af"
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
