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
