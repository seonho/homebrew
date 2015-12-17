# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Dlib < Formula
  desc "A modern C++ toolkit containing machine learning algorithms and tools"
  homepage "http://dlib.net"
  url "http://dlib.net/files/dlib-18.18.tar.bz2"
  version "18.18"
  sha256 "99133ed152e24d37dafa2dd19deac14d2e13c1b8ba6e187476d60f4d376117ca"

  depends_on "cmake" => :build
  depends_on "libpng"
  depends_on "jpeg"
  #depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    # system "./configure", "--disable-debug",
    #                       "--disable-dependency-tracking",
    #                       "--disable-silent-rules",
    #                       "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "cmake", "examples"
    system "make", "dlib"
    system "cd", "../.."
    include.install "dlib"
    lib.install "dlib_build/libdlib.a"
    # system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test dlib`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
