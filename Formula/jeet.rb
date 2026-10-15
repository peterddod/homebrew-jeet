# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.12.2"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.2/jeet-v0.12.2-aarch64-apple-darwin.tar.gz"
      sha256 "a8cc6a80a38b5bcfa20c0d9e2045b54e982d6e8ac372ba15817198636fa34b2f"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.2/jeet-v0.12.2-x86_64-apple-darwin.tar.gz"
      sha256 "af3d199d0f5fd2e7d85b5f1a40fe2c9846f4c83be6c5f1aeb318a647a3578b4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.2/jeet-v0.12.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "97da21ea620fb13b9262c1704107b00aab2b79a4d47ef999c16312006928dd9d"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.2/jeet-v0.12.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e49e30c5d6ef44117468772c849566ae5a47b17e920dc0e0a42ab5ad4396425"
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
