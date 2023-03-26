import Foundation
import Darwin

/// https://opensource.apple.com/source/cctools/cctools-870/include/mach-o/loader.h.auto.html

@frozen
public struct LoadCommand {
  /// type of load command
  // let cmd: LoadCommandType
  let cmd: UInt32

  /// total size of command in bytes
  let cmdsize: UInt32

  /// command data, size = cmdsize - 8
  let data: Data
}

extension LoadCommand {

  init(fileHandle: FileHandle) throws {
    cmd = fileHandle.readUint32()
    let cmdType = LoadCommandType(rawValue: cmd)
    cmdsize = fileHandle.readUint32()
    data = fileHandle.readData(ofLength: Int(cmdsize - 8))
    print("cmdType: 0x\(String(cmd, radix: 16)), loadCommandType: \(String(describing:cmdType)), cmdsize: \(cmdsize)")
    data.hexprint()
    print("\n")
  }
}

extension LoadCommand: CustomStringConvertible {
  public var description: String {
    let hexData = data.map { String(format: "%02x", $0) }.joined(separator: " ")
    return "cmdType: \(cmd) \nsize: \(cmdsize), \ndata: \(hexData)"
  }
}
