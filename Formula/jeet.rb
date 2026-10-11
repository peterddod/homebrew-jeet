# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.8.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.8.0/jeet-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "3e4d3cd18320d6da5c666d43bdf7c7dc7b3615158a005545cdfd9649907cc443"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.8.0/jeet-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "fc3a666c105cf15d2ea59321ed6ec3db273b873860e2abaaf1a0004105fbd605"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.8.0/jeet-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ef47b52f88cbf5371b755481f53ce7c4111c1fff252925439706b40f878923b"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.8.0/jeet-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b0ecd4ec4f2d8d2bbb23d7f95f9c725bfa43c2abafc7c6706dd9e3c573ff298d"
    end
  end

  depends_on "git"

  def install
    bin.install "jeet"
    generate_completions_from_executable(bin/"jeet", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jeet --version")
  end
end
