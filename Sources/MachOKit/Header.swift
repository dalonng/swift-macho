//
//  Header.swift
//  MachOKit
//
//  Created by d on 2023/3/14.
//

import Foundation

/// https://en.wikipedia.org/wiki/Mach-O#Multi-architecture_binaries
struct Header {
  /// 4 bytes
  var magicNumber: MagicNumber

  /// 4 bytes cpu type
  var cpuType: CpuType
}

@frozen
public enum MagicNumber: UInt32 {

  /// big-endian fat magic
  case fat_big_endian = 0xcafebabe

  /// little-endian fat magic
  case fat_little_endian = 0xbebafeca

  /// 64-bit big-endian fat magic
  case fat64_big_endian = 0xcafebabf

  /// 64-bit little-endian fat magic
  case fat64_little_endian = 0xbfbafeca

  /// 32-bit big-endian magic
  case mh32_big_endian = 0xfeedface

  /// 32-bit little-endian magic
  case mh32_little_endian = 0xcefaedfe

  /// 64-bit big-endian magic
  case mh64_big_endian = 0xfeedfacf

  /// 64-bit little-endian magic
  case mh64_little_endian = 0xcffaedfe

  /// compressed mach-o magic
  case comp = 0x636f6d70

  /// a compressed mach-o slice, using LZSS for compression
  case lzss = 0x6c7a7373

  /// a compressed mach-o slice, using LZVN ("FastLib") for compression
  case lzvn = 0x6c7a766e
}

@frozen
public enum CpuType: Int32 {

  /// mask for CPUs with 64-bit architectures (when running a 64-bit ABI?)
  case arch_abi64 = 0x01000000

  /// mask for CPUs with 64-bit architectures (when running a 32-bit ABI?)
  case arch_abi32 = 0x02000000

  /// m68k compatible CPUs
  case mc680X0 = 0x06

  /// i386 and later compatible CPUs
  case i386 = 0x07

  /// x86_64 (AMD64) compatible CPUs
  case x86_64 = 0x01000111  // (i386 | arch_abi64)

  /// 32-bit ARM compatible CPUs
  case arm = 0x0c

  /// 64-bit ARM compatible CPUs
  case arm64 = 0x0100000c  // (arm | arch_abi64)

  /// 64-bit ARM compatible CPUs (running in 32-bit mode?)
  case arm64_32 = 0x0200000c  //(arm | arch_abi32)
}
