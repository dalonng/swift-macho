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

extension Flags: CustomStringConvertible {
  public var description: String {
    var result = ""
    if contains(.noundefs) { result += "noundefs " }
    if contains(.incrlink) { result += "incrlink " }
    if contains(.dyldlink) { result += "dyldlink " }
    if contains(.bindatload) { result += "bindatload " }
    if contains(.prebound) { result += "prebound " }
    if contains(.split_segs) { result += "split_segs " }
    if contains(.lazy_init) { result += "lazy_init " }
    if contains(.twolevel) { result += "twolevel " }
    if contains(.force_flat) { result += "force_flat " }
    if contains(.nomultidefs) { result += "nomultidefs " }
    if contains(.noprefixbinding) { result += "noprefixbinding " }
    if contains(.prebindable) { result += "prebindable " }
    if contains(.allmodsbound) { result += "allmodsbound " }
    if contains(.subsections_via_symbols) { result += "subsections_via_symbols " }
    if contains(.canonical) { result += "canonical " }
    if contains(.weak_defines) { result += "weak_defines " }
    if contains(.binds_to_weak) { result += "binds_to_weak " }
    if contains(.allow_stack_execution) { result += "allow_stack_execution " }
    if contains(.root_safe) { result += "root_safe " }
    if contains(.setuid_safe) { result += "setuid_safe " }
    if contains(.no_reexported_dylibs) { result += "no_reexported_dylibs " }
    if contains(.pie) { result += "pie " }
    if contains(.dead_strippable_dylib) { result += "dead_strippable_dylib " }
    if contains(.has_tlv_descriptors) { result += "has_tlv_descriptors " }
    if contains(.no_heap_execution) { result += "no_heap_execution " }
    if contains(.app_extension_safe) { result += "app_extension_safe " }
    if contains(.nlist_outofsync_with_dyldinfo) { result += "nlist_outofsync_with_dyldinfo " }
    if contains(.sim_support) { result += "sim_support " }
    if contains(.dylib_in_cache) { result += "dylib_in_cache " }

    return result.trimmingCharacters(in: .whitespaces)
  }

}
