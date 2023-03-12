import Foundation
import MachOKit

@main
enum macho {
  static func main() async throws {
    await MachOCommand.main()
  }
}
