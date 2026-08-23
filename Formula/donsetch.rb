# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.0.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.0.0/donsetch-v3.0.0-darwin-x64.tar.gz"
      sha256 "e09f0a0e258cc4be400a4e354c02702bfe667951c98f9fd5277034a8417565e0"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.0.0/donsetch-v3.0.0-darwin-arm64.tar.gz"
      sha256 "418f88e8d37798accd1d034f78324ac2956676f548723ff079472ca42dc8de31"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.0.0/donsetch-v3.0.0-linux-x64.tar.gz"
      sha256 "c76134df134881bf09ebceb730839a225a48920ea5e6e5f6c8b92b29fe3aea2d"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.0.0/donsetch-v3.0.0-linux-arm64.tar.gz"
      sha256 "2075e5ecbb774b1b68ff006ac1d8bb03def72b4932e475aef2f847d757f56f99"
    end
  end

  def install
    bin.install "donsetch"
  end

  def caveats
    <<~EOS
      DonSeTch is an MCP server: connect from your MCP client via
        donsetch mcp
      Run `donsetch doctor` to verify the install.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/donsetch --version")
  end
end
