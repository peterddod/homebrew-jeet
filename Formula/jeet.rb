# typed: false
# frozen_string_literal: true

class Jeet < Formula
  desc "Global git repo index and worktree manager"
  homepage "https://github.com/peterddod/jeet"
  version "0.4.0"
  license "MIT"
  head "https://github.com/peterddod/jeet.git", branch: "main"

  on_macos do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.4.0/jeet-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "9486c1cd85d3eaa80b547cb4ca7fce1c4ca3be86275b3eff41687fb03a77b836"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.4.0/jeet-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "9d24c9b41a968e763093e14dce4d827d5b0752572a78eec5f59805440d2e1d78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peterddod/jeet/releases/download/v0.4.0/jeet-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b4ad52ef5885774788fe1855146fddc77eee766104facd788ae6f9ded514d14"
    end
    on_intel do
      url "https://github.com/peterddod/jeet/releases/download/v0.4.0/jeet-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4f93e1de30c1774a30557aef2d68966e8f02cc761a32984009c850042471c25"
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
