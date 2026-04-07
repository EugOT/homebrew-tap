class Gitstore < Formula
  desc "Separate .git and .jj databases from working trees for cloud-synced folders"
  homepage "https://github.com/EugOT/gitstore-cli"
  license "MIT"
  head "https://github.com/EugOT/gitstore-cli.git", branch: "main"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "--prefix", prefix
  end

  test do
    assert_match "Usage: gitstore", shell_output("#{bin}/gitstore --help 2>&1")
    system bin/"gitstore", "init"
  end
end
