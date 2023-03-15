import Foundation
import PathKit

public final class MachOFile {

  let fileHandle: FileHandle

  var header: Header?

  public init(path: String) {

    let filePath = Path(path)
    guard filePath.exists else {
      fatalError("\(filePath) is not exists.")
    }

    guard let fileHandle = FileHandle(forReadingAtPath: filePath.string) else {
      fatalError("forReadingAtPath \(filePath) error.")
    }
    self.fileHandle = fileHandle
  }

  public func readheader() {
    do {
      if let magic = try fileHandle.read(upToCount: 4) {
        if let ft = MagicNumber(rawValue: magic.uint32) {
          print("magic number: \(ft)")
        } else {
          print("unknow magic number: \(magic.uint32)")
        }
      }

      if let cpuType = try fileHandle.read(upToCount: 4) {
        print("cpuType: \(CpuType(rawValue: cpuType.uint32))")
      }
      if let cpuSubtype = try fileHandle.read(upToCount: 4) {
        print("cpuSubtype: \(cpuSubtype.uint32)")
      }
      if let fileType = try fileHandle.read(upToCount: 4) {
        if let ft = FileType(rawValue: fileType.uint32) {
          print("fileType: \(ft)")
        } else {
          print("unknow fileType: \(fileType.uint32)")
        }
      }

      if let loadCommandsCount = try fileHandle.read(upToCount: 4) {
        print("loadCommandsCount: \(loadCommandsCount)")
      }

      if let loadCommandsSize = try fileHandle.read(upToCount: 4) {
        print("loadCommandsSize: \(loadCommandsSize)")
      }
    } catch {
      fatalError("read header error: \(error)")
    }
  }

}
