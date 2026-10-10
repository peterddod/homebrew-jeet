# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.7.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.7.0/jeet-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "9f10c7fec1d596fe180242f32fa9e0738809933137df0992dea2d9033c161016"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.7.0/jeet-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "27b7a7892047b97e54dd5ac86ef6e375da50ba5131743b1f947a6320a40e0ee8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.7.0/jeet-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "330ed07fd41ca41f0ffcb04072e0983efc52b5328622cb2c770a0a10646c67a0"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.7.0/jeet-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1edcdbb7561893eb79cf210e520729f6e8b6180e5710702ccde2c6dcff176763"
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
