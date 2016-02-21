# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Exodus < Formula
  desc ""
  homepage ""
  url "https://raw.githubusercontent.com/shinriyo/exodus.rs/master/bin/exodus-0.1.tar.gz"
  version "0.1"
  sha256 "da5a8788e0b37a73680fb9eb14e90456f904f7303fe9b3f893bd9d5a38b8ca96"

  # depends_on "cmake" => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    # system "./configure", "--disable-debug",
    #                      "--disable-dependency-tracking",
    #                      "--disable-silent-rules",
    #                      "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    # system "make", "install" # if this fails, try separate make/make install steps
    system "cd /tmp"
    system "tar zxvf /Library/Caches/Homebrew/exodus-0.1.tar.gz"
    system "cd exodus"
    # これでバイナリでインストール
    bin.install Dir['bin/*']
    # なぜかcargo buildできない
=begin
    system "cp", "bin/exodus", "/usr/local/bin"
    system "multirust override stable"
    system "cargo build"
    system "cp target/debug/exodus /usr/local/bin"
=end
    # 後始末
    system "rm -rf ./exodus-tmp"
  end

  def caveats
    msg = <<-EOF.undent
    # exodus commandment
    exodus init

    # If you remove exodus.
    brew uninstall exodus
EOF
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test exodus`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
