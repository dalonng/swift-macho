import Foundation
import ArgumentParser
import PathKit

struct MachOCommand: ParsableCommand {
  init() {}

  @Argument
  var filePath: String

  mutating func run() throws {
    // var path = Path(filePath)

    print("macho path: \(filePath)")

  }
}
