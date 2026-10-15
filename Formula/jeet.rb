# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.13.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.13.0/jeet-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "fbdf7f8620ad600355eb8d42bac69555157de8366e3645f31a77060db5f06722"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.13.0/jeet-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "d27de78cf66f4ca0c88e9e223aba461a32af9749cc96b5cb945e363ed32ac10e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.13.0/jeet-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7600c753c747f8117db14d6784f56b56b899c3f4f8b3ab692afd782ec9bc57e4"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.13.0/jeet-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "81644b23f9ffcb52dd9e38932bc63d0796b365b3464a4ab5040b67711c1106ae"
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
