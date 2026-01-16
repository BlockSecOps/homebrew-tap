# Homebrew Formula for solidity-sbom
# For private repo: brew install --HEAD blocksecops/tap/solidity-sbom
# For public repo:  brew install blocksecops/tap/solidity-sbom

class SoliditySbom < Formula
  desc "Software Bill of Materials (SBOM) generator for Solidity smart contracts"
  homepage "https://github.com/BlockSecOps/SolidityBOM"
  url "https://github.com/BlockSecOps/SolidityBOM/releases/download/v0.9.7/solidity-sbom-v0.9.7-source.tar.gz"
  sha256 "34404818dbd0f61f70bfb38bb1664571dbf4d91dd6440d57f7bad960e9404a4d"
  license "MIT OR Apache-2.0"
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
