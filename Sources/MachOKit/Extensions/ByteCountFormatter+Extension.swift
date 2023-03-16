import Foundation

extension ByteCountFormatter {
  static let humanReadable: ByteCountFormatter = {
    let formatter = ByteCountFormatter()
    formatter.allowedUnits = [.useAll]
    formatter.countStyle = .file
    return formatter
  }()
}

extension UInt32 {
  var humanReadable: String {
    ByteCountFormatter.humanReadable.string(fromByteCount: Int64(self))
  }
}
