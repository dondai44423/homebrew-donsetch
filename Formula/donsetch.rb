# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.4.3"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.3/donsetch-darwin-x64.tar.gz"
      sha256 "a39cc34b534a84b03da22b734720bf28e11ffe8468a234c837fdefe389d7db21"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.3/donsetch-darwin-arm64.tar.gz"
      sha256 "e106c8f3ef642644579d750834f99ce0b52180e70bea5c8bb5831ccf2a66e1a8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.3/donsetch-linux-x64.tar.gz"
      sha256 "6d62be78c79b77c12db1d5630ccefdcb88f01f3e1950ac5a2a86ab76c074c85d"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.4.3/donsetch-linux-arm64.tar.gz"
      sha256 "fc705ceb9caa501d723d23ff41221395c7afe3cb47f06668fc3cca23957ea79d"
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
