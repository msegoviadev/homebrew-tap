class SpecMind < Formula
  desc "Convert OpenAPI and AsyncAPI specs to compact, LLM-friendly .mind format"
  homepage "https://github.com/msegoviadev/spec-mind"
  version "0.3.1"
  license "MIT"
  head "https://github.com/msegoviadev/spec-mind.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-darwin-arm64"
      sha256 "PLACEHOLDER_DARWIN_ARM64"
    end
    on_intel do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-darwin-x64"
      sha256 "PLACEHOLDER_DARWIN_X64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-linux-x64"
      sha256 "PLACEHOLDER_LINUX_X64"
    end
    on_arm do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-linux-arm64"
      sha256 "PLACEHOLDER_LINUX_ARM64"
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