# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.2.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.0/jeet-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "cdb10f389b54ed0bff0309383ecd3e2b80e1d62f321480c6c99205474b70f774"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.0/jeet-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "8ac289bfc7ca7b40e61b70a0ed22e117a5b32a8edeaf70199f930cc4b3ffecd3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.0/jeet-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58aa97e34f137638f9b8a7bfaadb5d4965fd5b8e25a270b60490ad614b7e9d97"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.0/jeet-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85a502c2085fda1b8c1d082473169f65eb3f2718c87d1157cdf964b658b63d88"
    end
  end

  depends_on "git"

  def install
    bin.install "jeet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jeet --version")
  end
end
