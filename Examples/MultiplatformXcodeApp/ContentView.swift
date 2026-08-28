import CodeViewerKit
import CodeViewerKitStandardLanguages
import Foundation
import SwiftUI

struct ContentView: View {
    @State private var highlightStore = CodeHighlightStore(
        grammars: CodeViewerKitStandardLanguages.all
    )

    // Replace `.bundledHTML` with `.inlineSwift` to use an inline string.
    private static let document = ExampleDocument.bundledHTML

    var body: some View {
        NavigationStack {
            CodeViewer(
                documentID: Self.document.id,
                sourceCode: Self.document.sourceCode,
                highlightStore: highlightStore,
                language: Self.document.language,
                lineWrapping: .word
            )
            .navigationTitle(Self.document.title)
        }
    }
}

private struct ExampleDocument {
    let id: String
    let title: String
    let sourceCode: String
    let language: CodeLanguage

    static let bundledHTML = Self(
        id: "lorem-ipsum-html",
        title: "Lorem Ipsum HTML",
        sourceCode: bundledSource(named: "lorem-ipsum-html", extension: "txt"),
        language: "html"
    )

    static let inlineSwift = Self(
        id: "greeting-view",
        title: "Inline Swift",
        sourceCode: """
        import SwiftUI

        struct GreetingView: View {
            let name: String

            var body: some View {
                Label("Hello, \\(name)!", systemImage: "swift")
                    .font(.title)
                    .padding()
            }
        }
        """,
        language: "swift"
    )

    private static func bundledSource(
        named name: String,
        extension pathExtension: String
    ) -> String {
        guard let url = Bundle.main.url(
            forResource: name,
            withExtension: pathExtension
        ), let sourceCode = try? String(contentsOf: url, encoding: .utf8) else {
            return "<!-- Add \(name).\(pathExtension) to the app target. -->"
        }
        return sourceCode
    }
}

#Preview {
    ContentView()
}
