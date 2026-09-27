# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.6.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.6.0/jeet-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "2642902efa9c7f8779a34d6cad978efc626f4f7d52a45449ccee71e412a3e446"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.6.0/jeet-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "a52887a4999091eaf0012c9e1bbf9d7ac458728fc9ba73982caa8ace87a88067"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.6.0/jeet-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b3e99a867e646ad18bb3e0e1bb5ec9480d2d4a1c823fbae4a6cbb51231ad8000"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.6.0/jeet-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32ea5632bd8e0a6fe6533a4634ad3f65b5e46cb99b23f07e0594c79f43c676ac"
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
