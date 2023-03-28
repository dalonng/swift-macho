import Foundation
import Darwin

@frozen
public struct SegmentCommand: LoadCommandable {
  /// LC_SEGMENT_64
  let cmd: UInt32
  /// includes sizeof section_64 structs
  let cmdsize: UInt32
  /// segment name, size 16 bytes
  let segname: String
  /// memory address of this segment
  let vmaddr: UInt64
  /// memory size of this segment
  let vmsize: UInt64
  /// file offset of this segment
  let fileoff: UInt64
  /// amount to map from the file
  let filesize: UInt64
  /// maximum VM protection, defint Int vm_prot_t
  let maxprot: vm_prot_t
  /// initial VM protection, defint Int vm_prot_t
  let initprot: vm_prot_t
  /// number of sections in segment
  let nsects: UInt32
  /// flags
  let flags: UInt32
}

extension SegmentCommand {
  init(cmd: UInt32, cmdsize: UInt32, fileHandle: FileHandle) throws {
    self.cmd = cmd
    self.cmdsize = cmdsize
    segname = fileHandle.readString(count: 16)
    vmaddr = fileHandle.readUint64()
    vmsize = fileHandle.readUint64()
    fileoff = fileHandle.readUint64()
    filesize = fileHandle.readUint64()
    maxprot = fileHandle.readInt32()
    initprot = fileHandle.readInt32()
    nsects = fileHandle.readUint32()
    flags = fileHandle.readUint32()
  }

  init(data: Data) throws {
    guard data.count == MemoryLayout<SegmentCommand>.size else {
      throw NSError(
        domain: "SegmentCommand",
        code: 0,
        userInfo: [
          NSLocalizedDescriptionKey: "Invalid data size"
        ]
      )
    }

    var offset = 0

    cmd = try data.read(from: &offset)
    cmdsize = try data.read(from: &offset)
    segname = try data.readTuple(from: &offset)
    vmaddr = try data.read(from: &offset)
    vmsize = try data.read(from: &offset)
    fileoff = try data.read(from: &offset)
    filesize = try data.read(from: &offset)
    maxprot = try data.read(from: &offset)
    initprot = try data.read(from: &offset)
    nsects = try data.read(from: &offset)
    flags = try data.read(from: &offset)
  }
}

extension SegmentCommand: CustomStringConvertible {
  public var description: String {
    var desc = ""
    desc += "cmd      : \(cmd)\n"
    desc += "cmdsize  : \(cmdsize)\n"
    desc += "segname  : \(segname)\n"
    desc += "vmaddr   : 0x\(String(vmaddr, radix: 16))\n"
    desc += "vmsize   : \(vmsize)\n"
    desc += "fileoff  : \(fileoff)\n"
    desc += "filesize : \(filesize)\n"
    desc += "maxprot  : \(maxprot)\n"
    desc += "initprot : \(initprot)\n"
    desc += "nsects   : \(nsects)\n"
    desc += "flags    : 0x\(String(flags, radix: 16))\n"
    return desc
  }
}
