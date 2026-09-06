# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases:
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents: stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.6.5"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.5/donsetch-darwin-x64.tar.gz"
      sha256 "b89512ac761a0936eaa7827d8880120f5c78dab1afd08d1d1c4212c2d9097e50"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.5/donsetch-darwin-arm64.tar.gz"
      sha256 "608693bc140ac9b40f1e96a05fda941e69a65949280502582bf4b12b8d62647a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.5/donsetch-linux-x64.tar.gz"
      sha256 "5196f9a73fe66c1f3715f03d33ddf0860d6f7d97c2bcbb3e48ea31991bfd4fc4"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.5/donsetch-linux-arm64.tar.gz"
      sha256 "3c282326e96e0104e17a7ff2d3ed88fa436388c46f259a49d0722df733bb32b0"
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