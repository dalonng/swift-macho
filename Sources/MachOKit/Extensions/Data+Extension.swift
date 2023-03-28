import Foundation

extension Data {
  var hexEncodedString: String {
    return map { String(format: "%02hhx", $0) }.joined()
  }

  var uint64: UInt64 {
    withUnsafeBytes { unsafeRawBufferPointer in
      unsafeRawBufferPointer.load(as: UInt64.self)
    }
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

// MARK: - String functions
extension Data {
  public var string: String? {
    String(data: self, encoding: .utf8)
  }
}

// MARK: - hex printing
extension Data {

  public func hexprint() {
    var offset = 0
    var line = ""
    var ascii = ""
    for (index, byte) in self.enumerated() {
      line += String(format: "%02x ", byte)
      ascii += (byte >= 32 && byte < 127) ? String(format: "%c", byte) : "."
      offset += 1
      if offset % 16 == 0 {
        print(line + " " + ascii)
        line = ""
        ascii = ""
      }
    }
    if line.count > 0 {
      print(line.formatString(fixedLenght: 48) + " " + ascii)
    }
  }
}
