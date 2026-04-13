class SpecMind < Formula
  desc "Convert OpenAPI and AsyncAPI specs to compact, LLM-friendly .mind format"
  homepage "https://github.com/msegoviadev/spec-mind"
  version "0.5.1"
  license "MIT"
  head "https://github.com/msegoviadev/spec-mind.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-darwin-arm64"
      sha256 "fde3ee293ae5212527051a8c7cd630036681cc89fcab8cecb50f8ab093b0ee9d"
    end
    on_intel do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-darwin-x64"
      sha256 "cef3ebb75cb3e9c629d099d103b77633b327e6bcf2efe53b9c648d43419036e5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-linux-x64"
      sha256 "a1ea6c3fec6782937c9c7f6b1972c5d795d6f96464d5d7501d00a76bcb4b414f"
    end
    on_arm do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-linux-arm64"
      sha256 "bfcede0a54562ad5826fddf40bcee1cafee9d0d618b17bcb7e94a8fd6883d3e8"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "spec-mind-darwin-arm64" : "spec-mind-darwin-x64"
    else
      Hardware::CPU.arm? ? "spec-mind-linux-arm64" : "spec-mind-linux-x64"
    end
    bin.install binary_name => "spec-mind"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spec-mind --version")
  end
end