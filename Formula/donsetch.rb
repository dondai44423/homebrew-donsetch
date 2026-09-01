# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.5.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.0/donsetch-darwin-x64.tar.gz"
      sha256 "4f6d0d89b7080a5d241fb2361e47241d5bcf8823bcf81a87e21eab9873ebd414"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.0/donsetch-darwin-arm64.tar.gz"
      sha256 "f45277bcce4d9f30140308c8097ca732bed4ad38f6160ac0915a7c03a14c61a3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.0/donsetch-linux-x64.tar.gz"
      sha256 "403bfafed3796a1ca68538faf22c2a417448777b72dbfb307f9d4cd39d582743"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.5.0/donsetch-linux-arm64.tar.gz"
      sha256 "bf8d7238721a635673d1c781554dda0b3fb52a433c9c178b1f7e2cb21611a264"
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
