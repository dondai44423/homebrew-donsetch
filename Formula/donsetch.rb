# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.1.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.1.0/donsetch-darwin-x64.tar.gz"
      sha256 "db0507f3bc22bf7f0a578bdd9ce1a5dbd62a5dc45e78b6253d99ad8d53768ada"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.1.0/donsetch-darwin-arm64.tar.gz"
      sha256 "b29596ed713cf2f06f7ba0fb92b084cfe81206a4fbfc1b433528de124ff2fb4e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.1.0/donsetch-linux-x64.tar.gz"
      sha256 "e74b829529df73ace160de620cfb906aeb478a9d085b0ffa9ebb30321a492ba9"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.1.0/donsetch-linux-arm64.tar.gz"
      sha256 "30423e368f6f2674c68f062a5fe3d867565488e631adea8d8c1ab9b11d271cc8"
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
