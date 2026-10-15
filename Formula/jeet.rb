# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.12.5"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.5/jeet-v0.12.5-aarch64-apple-darwin.tar.gz"
      sha256 "a44f17991d725a9cb6759f2eb318ff8c0b5973204e71b36656f7fcf89b964e69"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.5/jeet-v0.12.5-x86_64-apple-darwin.tar.gz"
      sha256 "a427eb37f1ac11f37852cef54277fea3c33acbc0d62f3dd66e1422761b514fa3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.5/jeet-v0.12.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2fe5a071532f529976407d3959293fca5fd9e4956db38f1ca48118476b0a1982"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.5/jeet-v0.12.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d8117b3540b2ef492685229ce0d9663b60fb866d98d90f52cd350e4ba77412e"
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
