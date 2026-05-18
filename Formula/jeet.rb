# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.2.3"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.3/jeet-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "ce7acabd4c0a2606e9968d24ef426f29ba129e40dfd71b74dcd63acbda61be8c"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.3/jeet-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "2a9fce5b55cc8260fd5a3154cea0c9e288ecc18db7a761d9ff9756cf9ff82d41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.3/jeet-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e90b007188e0580061b723bbc9c704d1961e9b1765446713c81f043c4993df25"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.3/jeet-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b7c3a9c8acbe4277a62f7a59fc023f6831cf4ba30a1e6c519e7b3b85a67e171a"
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
