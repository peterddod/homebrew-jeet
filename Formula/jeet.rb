# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.2.6"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.6/jeet-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "d5c193cd1e72d6c2f6c362e905880fc1d5e8862576d465726581ef820e31ac83"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.6/jeet-v0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "b4724fbbdd469d77935606f2961dd512763de88fa6e6ba95ffc6c6637367ab7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.6/jeet-v0.2.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d46f2f1279d1b3c35937739adb968376dfa2887c858d825236ca8a0dfd6e0a62"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.2.6/jeet-v0.2.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f1d6c6b3ac2bfba71417e05936f3cb80bd144d0ba5518028d1998ab6d28e3a2"
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
