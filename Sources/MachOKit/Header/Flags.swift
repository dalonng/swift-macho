import Foundation

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
