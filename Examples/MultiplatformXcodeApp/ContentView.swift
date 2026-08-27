import CodeViewerKit
import CodeViewerKitStandardLanguages
import SwiftUI

struct ContentView: View {
    @State private var highlightStore = CodeHighlightStore(
        grammars: CodeViewerKitStandardLanguages.all
    )

    private static let sourceCode = """
    import SwiftUI

    struct GreetingView: View {
        let name: String

        var body: some View {
            Label("Hello, \\(name)!", systemImage: "swift")
                .font(.title)
                .padding()
        }
    }
    """

    var body: some View {
        NavigationStack {
            CodeViewer(
                documentID: "greeting-view",
                sourceCode: Self.sourceCode,
                highlightStore: highlightStore,
                language: "swift",
                lineWrapping: .word
            )
            .navigationTitle("Code Viewer")
        }
    }
}

#Preview {
    ContentView()
}
