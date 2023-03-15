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

  /// 4 bytes cpu subtype (ArmCpuSubype | i386CpuSubype)
  var cpuSubtype: UInt32

  /// 4 bytes file type
  var fileType: FileType

  /// 4 bytes Number of load commands
  var loadCommandsCount: UInt32

  /// 4 bytes Size of load commands
  var loadCommandsSize: UInt32

  /// 4 bytes Flags
  var flags: Flags

  /// 4 bytes Reserved (64-bit only)
  var reserved: UInt32
}

// MARK: CpuType
@frozen
public struct CpuType: OptionSet {

  public let rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  /// mask for CPUs with 64-bit architectures (when running a 64-bit ABI?)
  static let arch_abi64 = CpuType(rawValue: 0x01000000)

  /// mask for CPUs with 64-bit architectures (when running a 32-bit ABI?)
  static let arch_abi32 = CpuType(rawValue: 0x02000000)

  /// i386 and later compatible CPUs
  static let i386 = CpuType(rawValue: 0x07)

  /// x86_64 (AMD64) compatible CPUs
  static let x86_64: CpuType = [.i386, .arch_abi64]

  /// 32-bit ARM compatible CPUs
  static let arm = CpuType(rawValue: 0x0c)

  /// 64-bit ARM compatible CPUs
  static let arm64: CpuType = [.arm, .arch_abi64]

  /// 64-bit ARM compatible CPUs (running in 32-bit mode?)
  static let arm64_32: CpuType = [.arm, .arch_abi32]
}

extension CpuType: CustomStringConvertible {
  public var description: String {
    switch self {
    case .i386: return "i386"
    case .x86_64: return "x86_64"
    case .arm: return "arm"
    case .arm64: return "arm64"
    default: return "unknown"
    }
  }
}

@frozen
public enum ArmCpuSubype: UInt32 {
  ///  0x00000000  All ARM processors.
  case all = 0x00000000

  ///  0x00000001  Optimized for ARM-A500 ARCH or newer.
  case a500_arch = 0x00000001

  ///  0x00000002  Optimized for ARM-A500 or newer.
  case a500 = 0x00000002

  ///  0x00000003  Optimized for ARM-A440 or newer.
  case a440 = 0x00000003

  ///  0x00000004  Optimized for ARM-M4 or newer.
  case m4 = 0x00000004

  ///  0x00000005  Optimized for ARM-V4T or newer.
  case v4t = 0x00000005

  ///  0x00000006  Optimized for ARM-V6 or newer.
  case v6 = 0x00000006

  ///  0x00000007  Optimized for ARM-V5TEJ or newer.
  case v5tej = 0x00000007

  ///  0x00000008  Optimized for ARM-XSCALE or newer.
  case xscale = 0x00000008

  ///  0x00000009  Optimized for ARM-V7 or newer.
  case v7 = 0x00000009

  ///  0x0000000A  Optimized for ARM-V7F (Cortex A9) or newer.
  case v7f = 0x0000000A

  ///  0x0000000B  Optimized for ARM-V7S (Swift) or newer.
  case v7s = 0x0000000B

  ///  0x0000000C  Optimized for ARM-V7K (Kirkwood40) or newer.
  case v7k = 0x0000000C

  ///  0x0000000D  Optimized for ARM-V8 or newer.
  case v8 = 0x0000000D

  ///  0x0000000E  Optimized for ARM-V6M or newer.
  case v6m = 0x0000000E

  ///  0x0000000F  Optimized for ARM-V7M or newer.
  case v7m = 0x0000000F

  ///  0x00000010  Optimized for ARM-V7EM or newer.
  case v7em = 0x00000010
}

extension ArmCpuSubype: CustomStringConvertible {
  public var description: String {
    switch self {
    case .all: return "All"
    case .xscale: return "XSCALE"
    case .v7: return "V7"
    case .v7f: return "V7F"
    default: return "unknown"
    }
  }
}

@frozen
public enum i386CpuSubype: UInt32 {
  ///  0x00000003  All x86 processors.
  case all = 0x00000003

  ///  0x00000004  Optimized for 486 or newer.
  case _486 = 0x00000004

  ///  0x00000084  Optimized for 486SX or newer.
  case _486sx = 0x00000084

  ///  0x00000056  Optimized for Pentium M5 or newer.
  case pentium_m5 = 0x00000056

  ///  0x00000067  Optimized for Celeron or newer.
  case celeron = 0x00000067

  ///  0x00000077  Optimized for Celeron Mobile.
  case celeron_mobile = 0x00000077

  ///  0x00000008  Optimized for Pentium 3 or newer.
  case _3 = 0x00000008

  ///  0x00000018  Optimized for Pentium 3-M or newer.
  case _3_M = 0x00000018

  ///  0x00000028  Optimized for Pentium 3-XEON or newer.
  case _3_xeon = 0x00000028

  ///  0x0000000A  Optimized for Pentium-4 or newer.
  case pentium_4 = 0x0000000A

  ///  0x0000000B  Optimized for Itanium or newer.
  case itanium = 0x0000000B

  ///  0x0000001B  Optimized for Itanium-2 or newer.
  case itanium_2 = 0x0000001B

  ///  0x0000000C  Optimized for XEON or newer.
  case xeon = 0x0000000C

  ///  0x0000001C  Optimized for XEON-MP or newer.
  case xeon_mp = 0x0000001C

}

@frozen
public struct Flags: OptionSet {
  public let rawValue: UInt32

  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  static let noundefs = Flags(rawValue: 0x1)

  static let incrlink = Flags(rawValue: 0x2)

  static let dyldlink = Flags(rawValue: 0x4)

  static let bindatload = Flags(rawValue: 0x8)

  static let prebound = Flags(rawValue: 0x10)

  static let split_segs = Flags(rawValue: 0x20)

  static let lazy_init = Flags(rawValue: 0x40)

  static let twolevel = Flags(rawValue: 0x80)

  static let force_flat = Flags(rawValue: 0x100)

  static let nomultidefs = Flags(rawValue: 0x200)

  static let noprefixbinding = Flags(rawValue: 0x400)

  static let prebindable = Flags(rawValue: 0x800)

  static let allmodsbound = Flags(rawValue: 0x1000)

  static let subsections_via_symbols = Flags(rawValue: 0x2000)

  static let canonical = Flags(rawValue: 0x4000)

  static let weak_defines = Flags(rawValue: 0x8000)

  static let binds_to_weak = Flags(rawValue: 0x10000)

  static let allow_stack_execution = Flags(rawValue: 0x20000)

  static let root_safe = Flags(rawValue: 0x40000)

  static let setuid_safe = Flags(rawValue: 0x80000)

  static let no_reexported_dylibs = Flags(rawValue: 0x100000)

  static let pie = Flags(rawValue: 0x200000)

  static let dead_strippable_dylib = Flags(rawValue: 0x400000)

  static let has_tlv_descriptors = Flags(rawValue: 0x800000)

  static let no_heap_execution = Flags(rawValue: 0x1000000)

  static let app_extension_safe = Flags(rawValue: 0x02000000)

  static let nlist_outofsync_with_dyldinfo = Flags(rawValue: 0x04000000)

  static let sim_support = Flags(rawValue: 0x08000000)

  static let dylib_in_cache = Flags(rawValue: 0x80000000)
}
