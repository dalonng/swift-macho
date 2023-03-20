import Foundation

extension Data {
  var hexEncodedString: String {
    return map { String(format: "%02hhx", $0) }.joined()
  }

  var uint32: UInt32 {
    withUnsafeBytes { unsafeRawBufferPointer in
      unsafeRawBufferPointer.load(as: UInt32.self)
    }
  }

  var int32: Int32 {
    withUnsafeBytes { unsafeRawBufferPointer in
      unsafeRawBufferPointer.load(as: Int32.self)
    }
  }
}
extension Data {
  func read<T>(from offset: inout Int) throws -> T {
    let size = MemoryLayout<T>.size
    guard offset + size <= count else {
      throw NSError(
        domain: "Data",
        code: 0,
        userInfo: [
          NSLocalizedDescriptionKey: "Invalid offset or size"
        ]
      )
    }
    defer { offset += size }
    return withUnsafeBytes { $0.load(fromByteOffset: offset, as: T.self) }
  }
}

extension Data {
  func readTuple<T>(from offset: inout Int) throws -> T {
    let size = MemoryLayout<T>.size
    guard offset + size <= count else {
      throw NSError(
        domain: "Data",
        code: 0,
        userInfo: [
          NSLocalizedDescriptionKey: "Invalid offset or size"
        ]
      )
    }
    defer { offset += size }
    return withUnsafeBytes { $0.load(fromByteOffset: offset, as: T.self) }
  }
}
