# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.2.2"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.2/donsetch-darwin-x64.tar.gz"
      sha256 "51999a3f573f887b12660e48a97f921d2642d47fea10471f3863ac92639028a9"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.2/donsetch-darwin-arm64.tar.gz"
      sha256 "863aaf721b3d32fa413a2d3ea87dd6bdb58d70e1a6d134937f217889c83e5199"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.2/donsetch-linux-x64.tar.gz"
      sha256 "98838317725df0ceb21798002181ff6499f2617e15c24b18e0175a4a8ceb78c4"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.2/donsetch-linux-arm64.tar.gz"
      sha256 "3f263c82b95d3d171af8572eb264f77c454f179a999c97756266478e4e0acea1"
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
