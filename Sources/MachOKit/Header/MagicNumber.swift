import Foundation

// MARK: MagicNumber
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

extension MagicNumber: CustomStringConvertible {
  public var description: String {
    switch self {
    case .fat_big_endian: return "fat_big_endian"
    case .fat_little_endian: return "fat_little_endian"
    case .fat64_big_endian: return "fat64_big_endian"
    case .fat64_little_endian: return "fat64_little_endian"
    case .mh32_big_endian: return "mh32_big_endian"
    case .mh32_little_endian: return "mh32_little_endian"
    case .mh64_big_endian: return "mh64_big_endian"
    case .mh64_little_endian: return "mh64_little_endian"
    case .comp: return "comp"
    case .lzss: return "lzss"
    case .lzvn: return "lzvn"
    }
  }
}
