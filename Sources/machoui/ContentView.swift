import SwiftUI

struct ContentView: View {

  @State private var document: InputDoument = InputDoument(input: "")
  @State private var isImporting: Bool = false

  var body: some View {
    HStack {
      Button(
        action: { isImporting = true },
        label: {
          Text("Push to browse to location of data file")
        }
      )
      Text(document.input)
    }
    .padding()
    .fileImporter(
      isPresented: $isImporting,
      allowedContentTypes: [.plainText],
      allowsMultipleSelection: false
    ) { result in
      do {
        guard let selectedFile: URL = try result.get().first else { return }
        guard let input = String(data: try Data(contentsOf: selectedFile), encoding: .utf8) else { return }
        document.input = input
      } catch {
        // Handle failure.
        print("Unable to read file contents")
        print(error.localizedDescription)
      }
    }
  }
}
