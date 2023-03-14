import Foundation
import MachOKit
import ArgumentParser
import PathKit

struct MachOCommand: ParsableCommand {
  init() {}

  @Argument
  var filePath: String

  mutating func run() throws {
    let path = Path(filePath)
    guard path.exists else {
      fatalError("\(path) is not exists.")
    }

    guard let fileHandle = FileHandle(forReadingAtPath: path.string) else {
      fatalError("forReadingAtPath \(path) error.")
    }

    do {
      if let magic = try fileHandle.read(upToCount: 4) {
        print("magic: \(MagicNumber(rawValue: magic.uint32))")
      }
      if let cpuType = try fileHandle.read(upToCount: 4) {
        print("cpuType: \(CpuType(rawValue: cpuType.int32))")
      }
    } catch {
      fatalError("read \(error) error.")

    }

  }
}

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
