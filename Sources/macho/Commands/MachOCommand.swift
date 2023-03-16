import Foundation
import MachOKit
import ArgumentParser
import PathKit

struct MachOCommand: ParsableCommand {
  init() {}

  @Argument
  var filePath: String

  mutating func run() throws {
    let _ = MachOFile(path: filePath)
  }
}
