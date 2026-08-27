# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.2.4"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.4/donsetch-darwin-x64.tar.gz"
      sha256 "b14f4664d3a991d6e88d8d9aab83c730a5d551fa9f4e33eb9ca75579544ce452"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.4/donsetch-darwin-arm64.tar.gz"
      sha256 "c78f482468870e3fab8e496fc1d7ae94c41e08a5ddb2fd891a8bedc1fc697e4d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.4/donsetch-linux-x64.tar.gz"
      sha256 "8db2dc4130464015b168d35f92f6dcd57bce0d9dedded83d3400def3bb77154a"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.2.4/donsetch-linux-arm64.tar.gz"
      sha256 "5f158cd921c95790a3003d2526b16f643b4fec899e3c300fbdd67bc6854cbfc8"
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
