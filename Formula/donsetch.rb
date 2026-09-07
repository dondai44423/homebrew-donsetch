# DonSeTch homebrew formula (v3).
# Versions live at https://github.com/dondai44423/donsetch/releases:
# update `version` + `sha256` arms at release time.
class Donsetch < Formula
  desc "Web fetch, search and crawl for AI agents: stealthy, keyless, token-efficient MCP server"
  homepage "https://github.com/dondai44423/donsetch"
  version "3.6.7"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.7/donsetch-darwin-x64.tar.gz"
      sha256 "03c9a8639b430a25e40431729a53ad54865b2ed8fd6314d83b754add06055339"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.7/donsetch-darwin-arm64.tar.gz"
      sha256 "b3038a77a753e9e2d1117d53cb0c1798fbba92a40acd7a835a21d650df470a0b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.7/donsetch-linux-x64.tar.gz"
      sha256 "9d12a7d99a9e7749164bf116bf756250e420fe9d9b8ceb57dcf4a4d1e5dd877e"
    else
      url "https://github.com/dondai44423/donsetch/releases/download/v3.6.7/donsetch-linux-arm64.tar.gz"
      sha256 "47cfb1d92fe4e5605742965954c9f5c82761fbc008ab055f85e55f3860809eb4"
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