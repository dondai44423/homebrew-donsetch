# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.5.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.0/donsetch-darwin-x64.tar.gz"
      sha256 "71dcdadbb606d65fd0e4201a3d46ac08f98c87da9c60a561815af66ca3036f37"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.0/donsetch-darwin-arm64.tar.gz"
      sha256 "927883de61a0cda36c43cdcd6a226afcbefeff0fc8b6f4fee11f0a235fbec436"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.0/donsetch-linux-x64.tar.gz"
      sha256 "a1a66f806289f0c9c5a488e5f366f2559739ef25b98c9fc2a596a2cfaee77129"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.0/donsetch-linux-arm64.tar.gz"
      sha256 "f5d5f35eb4c53ecaae1e36173accb98fae0e50ed7dbe10270bd7c0d388c75887"
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
