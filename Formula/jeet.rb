# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.12.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.0/jeet-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "c56031d48650ebadfa2eaa652cf5132fbc62a7df29b33792fe4e92a2de38bcf6"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.0/jeet-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "1bae183bad6e86caabae86d57b72d2a6faaf99c9faa008edddfb5ad2eae54c32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.0/jeet-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2fc46f918e353a34735703f1df0fac0f82ceda3c080eefdf8832ee28af410862"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.12.0/jeet-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc83b341eed22eb021b4412f4ada44530e2893d6c6ed3b040ae8280bf1f969ab"
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
