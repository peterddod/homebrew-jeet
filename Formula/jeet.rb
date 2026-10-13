# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.9.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.9.0/jeet-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "ec483270367745257b36756b1807bacd6558733a9e0370c283acecc29060e256"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.9.0/jeet-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "b572bd3f02f0a0947c7bf70448c4afa0d524979bfb3473e75f0d8a2531b716ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.9.0/jeet-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a551152ed3dbfaaad08eaa7b690c2f8053a7a8536f22bd5c808d37f9a871793d"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.9.0/jeet-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d46d86a0cc57980b8909f79e050a1c99ef71982e5e7ce8742868a0f1eac9f8f"
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
