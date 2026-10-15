# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.12.3"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.3/jeet-v0.12.3-aarch64-apple-darwin.tar.gz"
      sha256 "26fb29a7875228908f6227af8614a60165161313868db011b61bff2f06f4f36a"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.3/jeet-v0.12.3-x86_64-apple-darwin.tar.gz"
      sha256 "ec231b006b39b8d075bb3387038eb1adef08c453dcb616cadef57620e385aa18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.3/jeet-v0.12.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45ecc4aa0582741cdeb1e0ea775696d7bafe7df1f055bb0f9171ceed8a6e9c37"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.3/jeet-v0.12.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d77162057a0db513bea002c62173c69bfdb48c1bdff313f739d3c19d350abf0"
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
