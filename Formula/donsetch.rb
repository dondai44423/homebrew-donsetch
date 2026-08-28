# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases —
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents — stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.3.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.3.0/donsetch-darwin-x64.tar.gz"
      sha256 "9e583d7d5639d54e701d03743cd1168544a5321de39d8eed8699e37fbc947104"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.3.0/donsetch-darwin-arm64.tar.gz"
      sha256 "fae8768787ecf07b935a7f0b9d7e15afdb63f71a703c1d0fff4374510f6a8004"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.3.0/donsetch-linux-x64.tar.gz"
      sha256 "699d10453b4a8d4ae0ba807fb7ebdb28ef6450c1a8836c04d129eba16e7e777f"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.3.0/donsetch-linux-arm64.tar.gz"
      sha256 "224d89416b1143dc0d08143fa1fb2ce2e2c943496190b1f82b3dc323c625a2fa"
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
