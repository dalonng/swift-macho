import Foundation

@frozen
public enum ArmCpuSubtype: UInt32 {
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

extension ArmCpuSubtype: CustomStringConvertible {
  public var description: String {
    switch self {
    case .all: return "All"
    case .a500_arch: return "A500 ARCH"
    case .a500: return "A500"
    case .a440: return "A440"
    case .m4: return "M4"
    case .v4t: return "V4T"
    case .v6: return "V6"
    case .v5tej: return "V5TEJ"
    case .xscale: return "XSCALE"
    case .v7: return "V7"
    case .v7f: return "V7F"
    case .v7s: return "V7S"
    case .v7k: return "V7K"
    case .v8: return "V8"
    case .v6m: return "V6M"
    case .v7m: return "V7M"
    case .v7em: return "V7EM"
    }
  }
}
