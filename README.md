# BlockSecOps Homebrew Tap

This is the official Homebrew tap for [SolidityDefend](https://github.com/BlockSecOps/SolidityDefend), a high-performance static analysis security tool for Solidity smart contracts.

## Installation

```bash
# Add the tap
brew tap BlockSecOps/tap

# Install SolidityDefend
brew install soliditydefend

# Verify installation
soliditydefend --version
```

## Usage

```bash
# Analyze a contract
soliditydefend contract.sol

# Show all 204 detectors
soliditydefend --list-detectors

# Filter by severity
soliditydefend --severity critical,high contracts/
```

## Update

```bash
# Update to latest version
brew upgrade soliditydefend
```

## Uninstall

```bash
brew uninstall soliditydefend
brew untap BlockSecOps/tap
```

## Available Packages

- **soliditydefend** (v1.3.2) - 204 security detectors for Solidity smart contracts
  - Account Abstraction (ERC-4337) vulnerability detection
  - Flash loan security analysis
  - DeFi protocol security checks
  - Oracle manipulation detection
  - And 200+ more detectors

## Requirements

- macOS or Linux
- Rust toolchain (automatically installed via Homebrew)

## Links

- **Main Repository**: https://github.com/BlockSecOps/SolidityDefend
- **Documentation**: https://github.com/BlockSecOps/SolidityDefend/tree/main/docs
- **Issues**: https://github.com/BlockSecOps/SolidityDefend/issues
- **Releases**: https://github.com/BlockSecOps/SolidityDefend/releases

## License

MIT OR Apache-2.0
