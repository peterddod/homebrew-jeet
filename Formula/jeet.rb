# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.14.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.14.0/jeet-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "f1a250944a2313b1bd8529c42f79f34cd631032fc2c3769abdf580dde88f7ab9"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.14.0/jeet-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "7766b6367f16a93363d9a64dea9214a00f140dfefd37ae9b04ef87068c468658"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.14.0/jeet-v0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5a8795b353735820ecb4ce2d97da1c03c4defc0dbd1e8735caa81e32f349506"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.14.0/jeet-v0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ad116bd1f14754efbcbe13cdb0e5116041911ea892fb21bee2dd7e34a663d29"
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
