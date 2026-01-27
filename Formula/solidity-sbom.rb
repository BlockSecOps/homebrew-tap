# Homebrew Formula for solidity-sbom
# To install locally for testing: brew install --build-from-source Formula/solidity-sbom.rb
# Note: For private repos, use: brew install --HEAD Formula/solidity-sbom.rb

class SoliditySbom < Formula
  desc "Software Bill of Materials (SBOM) generator for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityBOM"
  url "https://github.com/BlockSecOps/SolidityBOM/archive/refs/tags/v0.9.13.tar.gz"
  sha256 "8aa8bc1521de567095c5ec0ee0bd8108116f0d35fdf1874b0fbfc37d273f9ec1"
  license :cannot_represent
  head "https://github.com/BlockSecOps/SolidityBOM.git", branch: "main"

  depends_on "rust" => :build

  def install
    cd "solidity-sbom" do
      system "cargo", "install", *std_cargo_args
    end
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
