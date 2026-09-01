# typed: false
# frozen_string_literal: true

# Prebuilt-binary formula for mandible. Updated automatically by the
# release workflow in AS-FOSS/mandible; version and checksums below always
# describe one released tag's assets.
class Mandible < Formula
  desc "Universal, interactive TUI reference for CLI tools"
  homepage "https://github.com/AS-FOSS/mandible"
  version "0.6.1"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e2a918731937bcee0e3a023a7419b26d8fe1f93456950d055f92eabab3ccd1e3"
    else
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9db59e0d5cd7887094d556be4fb7c447ae573a50c20ae187165e1df6b841df94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3df4d6dd8772c9bd15e14ead8c716e5e884df332b17515ab76661f98f4ae1c21"
    else
      url "https://github.com/AS-FOSS/mandible/releases/download/v#{version}/mandible-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d035ee5877cbff8c2a820b36a4982dee1911ae588dd22e0d1e2c7713f461827"
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
