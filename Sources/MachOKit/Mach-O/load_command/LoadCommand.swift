import Foundation
import Darwin

/// https://opensource.apple.com/source/cctools/cctools-870/include/mach-o/loader.h.auto.html

@frozen
public struct LoadCommand {
  /// type of load command
  let cmd: LoadCommandType

  /// total size of command in bytes
  let cmdsize: UInt32
}


extension LoadCommand {
  public static loadCommand() -> LoadCommand {
    LoadCommand(cmd: .segment, cmdsize: 0)
  }
}
