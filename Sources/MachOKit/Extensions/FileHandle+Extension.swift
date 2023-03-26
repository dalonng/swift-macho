import Foundation

extension FileHandle {
  /// read 4 bytes from file, and convert to UInt32
  func readUint32() -> UInt32 {
    do {
      if let data = try read(upToCount: 4) {
        return data.uint32
      }
    } catch {
      fatalError("read uint32 error: \(error)")
    }
    return UInt32.max
  }

    /// read 4 bytes from file, and convert to UInt32
  func readInt32() -> Int32 {
    do {
      if let data = try read(upToCount: 4) {
        return data.int32
      }
    } catch {
      fatalError("read uint32 error: \(error)")
    }
    return Int32.max
  }
}
