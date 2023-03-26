import Foundation
import PathKit

public final class MachOFile {

  let fileHandle: FileHandle

  let header: MachHeader

  var loadCommands = [LoadCommand]()

  public init(path: String) {

    let filePath = Path(path)
    guard filePath.exists else {
      fatalError("\(filePath) is not exists.")
    }

    guard let fileHandle = FileHandle(forReadingAtPath: filePath.string) else {
      fatalError("forReadingAtPath \(filePath) error.")
    }
    self.fileHandle = fileHandle
    self.header = Self.readHeader(fileHandle: fileHandle)
    print("\(header)")
    readCmd(fileHandle: fileHandle)
  }

  static func readHeader(fileHandle: FileHandle) -> MachHeader {
    var value = fileHandle.readUint32()
    guard let magicNumber = MagicNumber(rawValue: value) else {
      fatalError("unknow magic number: \(value)")
    }

    value = fileHandle.readUint32()
    let cpuType = CpuType(rawValue: value)

    let cpuSubtype = fileHandle.readUint32()

    value = fileHandle.readUint32()
    guard let fileType = FileType(rawValue: value) else {
      fatalError("unknow file type: \(value)")
    }

    let ncmds = fileHandle.readUint32()
    value = fileHandle.readUint32()
    let flags = Flags(rawValue: value)

    return MachHeader(
      magic: magicNumber,
      cpuType: cpuType,
      cpuSubtype: cpuSubtype,
      fileType: fileType,
      ncmds: ncmds,
      sizeofcmds: fileHandle.readUint32(),
      flags: flags,
      reserved: fileHandle.readUint32()
    )

  }

  func readCmd(fileHandle: FileHandle) {
    for _ in 0..<header.ncmds {
      do {
        loadCommands.append(try LoadCommand(fileHandle: fileHandle))
      } catch {
        fatalError("readCmd error: \(error)")
      }
    }
  }
}
