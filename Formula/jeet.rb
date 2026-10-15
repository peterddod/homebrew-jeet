# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.12.1"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.1/jeet-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "b6434ffbc72d878d32ae2061553515a3483d767baba244845ac783d8e0ee7b30"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.1/jeet-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "19fd2a37f516195013446c56ee767be365cf3399f3f10e1dd81986d1cc75adf2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.1/jeet-v0.12.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15cdac2439bdc92f33f630d9d2ceb12d6d45ea8f0a39e09690476e09b5b68262"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.1/jeet-v0.12.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4959849be4c0a664c93216654ace2925dfaf64089de9c496641b154b699895d2"
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
