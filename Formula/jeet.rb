# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.8.1"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.8.1/jeet-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "b1816b7c6aee58fcbee49d5d6cbe9a5bd928010fada7823902ebae1a52f4b057"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.8.1/jeet-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "881e9deaee2dfe4d742b3faaebe5fe2e2fc1789a360933d5aa8baf35c248e415"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.8.1/jeet-v0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a294c35b68b4815b49b72a35a023181c27cf8817b5e6c2f658dc30ea697e8fc1"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.8.1/jeet-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d359938119c8eacf762eac38ef571daae22061b2bd1fc7a4776cb835d52c99aa"
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
