import ArgumentParser
import MachOKit

struct VersionCommand: ParsableCommand {
  static var configuration: CommandConfiguration {
    CommandConfiguration(
      commandName: "version",
      abstract: "Outputs the current version of macho"
    )
  }

  func run() throws {
    print("\(Constants.version)")
  }
}
