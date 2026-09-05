# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases:
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents: stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.6.3"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.3/donsetch-darwin-x64.tar.gz"
      sha256 "a5d830de6bd778e49f546278282e28cfb4993bfbdf589b23d4a79c085e10942a"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.3/donsetch-darwin-arm64.tar.gz"
      sha256 "b913db0e211c32c2d7803a9032371f10fc078cf94990977ac04dbdc74b375201"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.3/donsetch-linux-x64.tar.gz"
      sha256 "6fcea3ac067d860d6af8143703052ad5fec5037d4661ef7715746b6a5c89fec6"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.3/donsetch-linux-arm64.tar.gz"
      sha256 "ba3d504375520c6ae528fbc3ef8239b1ce05c7a04b6205ee201587cc29f242cb"
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