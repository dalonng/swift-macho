import Foundation

extension String {
  func formatString(fixedLenght: Int, spacer: String = " ") -> String {
    return "\(self)\(String(repeating: spacer, count: fixedLenght - count))"
  }
}
