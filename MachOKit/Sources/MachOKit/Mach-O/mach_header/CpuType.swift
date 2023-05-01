import Foundation

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
    default: return "unsupported"
    }
  }
}

extension CpuType {
  var isArm: Bool {
    self.contains(.arm) || self.contains(.arm64) || self.contains(.arm64_32)
  }

  var is_x86: Bool {
    self.contains(.i386) || self.contains(.x86_64)
  }
}
