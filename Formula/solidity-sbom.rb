# Homebrew Formula for solidity-sbom
# To install locally for testing: brew install --build-from-source Formula/solidity-sbom.rb

class SoliditySbom < Formula
  desc "Software Bill of Materials (SBOM) generator for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityBOM"
  url "https://github.com/BlockSecOps/SolidityBOM/releases/download/v0.9.5/solidity-sbom-v0.9.5-source.tar.gz"
  sha256 "97ba884db6ffa915eaa6a4a53faaf7f28bf9f2f277776665ceffa7ced89f2921"
  license "MIT OR Apache-2.0"
  head "https://github.com/BlockSecOps/SolidityBOM.git", branch: "main"

  depends_on "rust" => :build

  def install
    cd "solidity-sbom" do
      system "cargo", "install", *std_cargo_args
    end

    # Install shell completions
    generate_completions_from_executable(bin/"solidity-sbom", "completions")
  end

  test do
    # Verify the binary works
    assert_match "solidity-sbom", shell_output("#{bin}/solidity-sbom --version")

    # Test analyze command help
    assert_match "Generate SBOM", shell_output("#{bin}/solidity-sbom analyze --help")

    # Test graph command help
    assert_match "dependency graph", shell_output("#{bin}/solidity-sbom graph --help")

    # Test init command help
    assert_match "configuration", shell_output("#{bin}/solidity-sbom init --help")
  end
end
