class SpecMind < Formula
  desc "Convert OpenAPI and AsyncAPI specs to compact, LLM-friendly .mind format"
  homepage "https://github.com/msegoviadev/spec-mind"
  version "0.6.1"
  license "MIT"
  head "https://github.com/msegoviadev/spec-mind.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-darwin-arm64"
      sha256 "4259a697f2879f8108e1b7da47fab4ed93fc639fc3c417ae28ef9a9a1ca53576"
    end
    on_intel do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-darwin-x64"
      sha256 "3a30537e5a456d95510f5dbb51e1b653ba9b0e729fcfe7855a5ac745128b210a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-linux-x64"
      sha256 "f8fbe8ea335e94981598bca1ded5acea9bdc835757d8faa9b296f53b74a8302d"
    end
    on_arm do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-linux-arm64"
      sha256 "1539fb69607cd4d48b2315a91a44271bb26c16dfdea21982d446cfb1263a66e7"
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