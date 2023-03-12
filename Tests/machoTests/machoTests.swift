import XCTest

@testable import macho

final class machoTests: XCTestCase {
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(macho().text, "Hello, World!")
  }

  func testNonexistentMachOFile() throws {
    URL
    let file = MachOFile(path: URL(fileURLWithPath: "/this/is/a/file/that/cannot/possibly/exist"))
    XCTAssertEqual(file.path.path, "/usr/lib/libSystem.B.dylib")
  }

}
