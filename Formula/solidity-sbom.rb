# Homebrew Formula for solidity-sbom
# To install locally for testing: brew install --build-from-source Formula/solidity-sbom.rb

class SoliditySbom < Formula
  desc "Software Bill of Materials (SBOM) generator for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityBOM"
  url "https://github.com/BlockSecOps/SolidityBOM/releases/download/v0.9.2/v0.9.2.tar.gz"
  sha256 "456fc2269be5754471a2c4b2883affb4b5aac2721236a6eb5fe6f35a7e4b9a02"
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
