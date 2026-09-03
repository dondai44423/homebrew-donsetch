# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases:
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents: stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.5.2"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.2/donsetch-darwin-x64.tar.gz"
      sha256 "f7fb0d8cfdc10758a801f8d37877bd72af795c32dbe021c8438498bb42056d88"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.2/donsetch-darwin-arm64.tar.gz"
      sha256 "8665c598686963e5f9dd491a1a1e48d26e978ceef25a2203550b9f445e79af1f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.2/donsetch-linux-x64.tar.gz"
      sha256 "5febb094fc316ba28a49716edcd3753d0719a4decddc2d0818658c4555a93f2a"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.2/donsetch-linux-arm64.tar.gz"
      sha256 "33af517589283dfadb7dad43674d0c0c36a11fe363ce30daee5de5cd950396cc"
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