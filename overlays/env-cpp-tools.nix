self: super:
{
  cppToolsEnv = super.buildEnv {
    name = "cppTools";
    paths = [
      self.boost
      self.clang-tools
      self.cmake
      self.cppcheck
      self.gdb
      self.libcxx
      self.libcxxabi
      self.qcachegrind
      self.rtags
      self.stdman
      self.valgrind
    ];
  };

  langToolsEnv = super.buildEnv {
    name = "langTools";
    paths = [
      self.autoconf
      self.automake
      self.global
      self.gnum4
      self.gnumake
      self.libtool
      self.pkgconfig
    ];
  };
}
