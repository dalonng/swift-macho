import Foundation

@frozen
public enum i386CpuSubtype: UInt32 {
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

extension i386CpuSubtype: CustomStringConvertible {
  public var description: String {
    switch self {
    case .all: return "All"
    case ._486: return "486"
    case ._486sx: return "486SX"
    case .pentium_m5: return "Pentium M5"
    case .celeron: return "Celeron"
    case .celeron_mobile: return "Celeron Mobile"
    case ._3: return "3"
    case ._3_M: return "3-M"
    case ._3_xeon: return "3-XEON"
    case .pentium_4: return "Pentium-4"
    case .itanium: return "Itanium"
    case .itanium_2: return "Itanium-2"
    case .xeon: return "XEON"
    case .xeon_mp: return "XEON-MP"
    }
  }
}
