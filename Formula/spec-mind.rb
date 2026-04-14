class SpecMind < Formula
  desc "Convert OpenAPI and AsyncAPI specs to compact, LLM-friendly .mind format"
  homepage "https://github.com/msegoviadev/spec-mind"
  version "0.5.2"
  license "MIT"
  head "https://github.com/msegoviadev/spec-mind.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-darwin-arm64"
      sha256 "b90eaf7df12a93d3656c95e7cb89ac19570dce754685cb9c04840b983df06ec3"
    end
    on_intel do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-darwin-x64"
      sha256 "8c30647b59224522363512677cfc8f1af97c8006c8d6442910fbdd7e82b517f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-linux-x64"
      sha256 "e8dd626e33fbbab196e00fbc75d9643bef5b463b81e89b0efacd45214dbaa311"
    end
    on_arm do
      url "https://github.com/msegoviadev/spec-mind/releases/download/v#{version}/spec-mind-linux-arm64"
      sha256 "ef2d6e886ff6820a93680db163122b22b752986ac0d58b454110d3f3d3d11adc"
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