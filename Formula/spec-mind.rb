class SpecMind < Formula
  desc "Convert OpenAPI and AsyncAPI specs to compact, LLM-friendly .mind format"
  homepage "https://github.com/msegoviadev/spec-mind"
  version "0.5.0"
  license "MIT"
  head "https://github.com/msegoviadev/spec-mind.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-darwin-arm64"
      sha256 "39f2e6c537897eb3ff4a7d9e1ed68a5cc76970ac5d46eac989938329cb1085b5"
    end
    on_intel do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-darwin-x64"
      sha256 "7016b61fc789ec3d1b789a58f3d23cd97b864100687dcb66b0a7316bffd2d8ef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-linux-x64"
      sha256 "faa1b5b79d152c65627fd52822d388ff96b23c74b7b46fd227d302a4137f8856"
    end
    on_arm do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-linux-arm64"
      sha256 "dd8703e87f44d9f20ede2d8283140f1ac2b47923a141fa7d727d43fae4d35a44"
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