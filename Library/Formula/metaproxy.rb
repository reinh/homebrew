require 'formula'

class Metaproxy < Formula
  homepage 'http://www.indexdata.com/metaproxy'
  url 'http://ftp.indexdata.dk/pub/metaproxy/metaproxy-1.3.52.tar.gz'
  sha1 '3577404bbe4bb05b8083aa1e88c0c2417c0bf183'

  depends_on 'pkg-config' => :build
  depends_on 'yazpp'
  depends_on 'boost149'

  def install
    old_boost = Formula.factory("boost149")
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-boost=#{old_boost.prefix}"
    system "make install"
  end
end
