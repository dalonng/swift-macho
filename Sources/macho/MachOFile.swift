import Foundation

public final class MachOFile {

  let pathUrl: URL

  public init(pathUrl: String) {
    self.pathUrl = URL(fileURLWithPath: pathUrl)
  }

  public init(pathUrl: URL) {
    self.pathUrl = pathUrl
  }
}
