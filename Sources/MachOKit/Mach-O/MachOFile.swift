import Foundation
import PathKit

public final class MachOFile {

  let fileHandle: FileHandle

  let header: MachHeader

  // var segmentCommands: [SegmentCommand]

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
    Self.readCmd(fileHandle: fileHandle)
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

    value = fileHandle.readUint32()
    let flags = Flags(rawValue: value)

    return MachHeader(
      magic: magicNumber,
      cpuType: cpuType,
      cpuSubtype: cpuSubtype,
      fileType: fileType,
      ncmds: fileHandle.readUint32(),
      sizeofcmds: fileHandle.readUint32(),
      flags: flags,
      reserved: fileHandle.readUint32()
    )

  }

  static func readCmd(fileHandle: FileHandle) {
    let cmdType = fileHandle.readUint32()
    let loadCommandType = LoadCommandType(rawValue: cmdType)
    let cmdsize = fileHandle.readUint32()

    print("cmdType: 0x\(String(cmdType, radix: 16)), loadCommandType: \(loadCommandType), cmdsize: \(cmdsize)")

  }

}
