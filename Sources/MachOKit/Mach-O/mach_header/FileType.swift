import Foundation

// MARK: file type
@frozen
public enum FileType: UInt32 {
  ///  0x00000001  Relocatable object file.
  case object = 0x00000001

  ///  0x00000002  Demand paged executable file.
  case execute = 0x00000002

  ///  0x00000003  Fixed VM shared library file.
  case fvmlib = 0x00000003

  ///  0x00000004  Core file.
  case core = 0x00000004

  ///  0x00000005  Preloaded executable file.
  case preload = 0x00000005

  ///  0x00000006  Dynamically bound shared library file.
  case dylib = 0x00000006

  ///  0x00000007  Dynamic link editor.
  case dylinker = 0x00000007

  ///  0x00000008  Dynamically bound bundle file.
  case bundle = 0x00000008

  ///  0x00000009  Shared library stub for static linking only, no section contents.
  case dylib_stub = 0x00000009

  ///  0x0000000A  Companion file with only debug sections.
  case dsym = 0x0000000A

  ///  0x0000000B  x86_64 kexts.
  case kext_bundle = 0x0000000B

  ///  0x0000000C  a file composed of other Mach-Os to be run in the same userspace sharing a single linkedit.
  case fileset = 0x0000000C
}

extension FileType: CustomStringConvertible {
  public var description: String {
    switch self {
    case .object: return "object"
    case .execute: return "execute"
    case .fvmlib: return "fvmlib"
    case .core: return "core"
    case .preload: return "preload"
    case .dylib: return "dylib"
    case .dylinker: return "dylinker"
    case .bundle: return "bundle"
    case .dylib_stub: return "dylib_stub"
    case .dsym: return "dsym"
    case .kext_bundle: return "kext_bundle"
    case .fileset: return "fileset"
    }
  }
}
