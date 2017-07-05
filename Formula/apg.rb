class Apg < Formula
  desc "Tool set for random password generation"
  homepage "http://www.adel.nursat.kz/apg/"
  url "http://http.debian.net/debian/pool/main/a/apg/apg_2.2.3.dfsg.1.orig.tar.gz"
  sha256 "c7e3c556426e2d5d2f599873a71100c5f6d14fa8784e0b1d879916784de801df"

  bottle do
    cellar :any_skip_relocation
    sha256 "501a5f98cc6de3e4a0a6727db6133e477b8c1ce32b78efc38c6b9e711b55d9a1" => :sierra
    sha256 "3192b54701707ca69212ab7830f6814f81f96854e06b32e46c9413bd2a6f4cfb" => :el_capitan
    sha256 "834bb84d2209ae2ff3b663567ef2142d7ed513826b648e7c7246a4e8cf243f33" => :yosemite
    sha256 "3005aebd42cef1af15dad861bea49202928f9d2bd672a2ebfae0afffc8ddf291" => :mavericks
    sha256 "bbe17982d5a6d9d91519b8d0e9d134c25f2098bb3225627a3806df09c00761f2" => :mountain_lion
  end

  def install
    system "make", "standalone",
                   "CC=#{ENV.cc}",
                   "FLAGS=#{ENV.cflags}",
                   "LIBS=", "LIBM="

    bin.install "apg", "apgbfm"
    man1.install "doc/man/apg.1", "doc/man/apgbfm.1"
  end

  test do
    system bin/"apg", "-a", "1", "-M", "n", "-n", "3", "-m", "8", "-E", "23456789"
  end
end
